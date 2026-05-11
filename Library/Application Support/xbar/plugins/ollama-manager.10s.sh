#!/usr/bin/env bash
# <xbar.title>Ollama Manager</xbar.title>
# <xbar.version>v1.6</xbar.version>
# <xbar.author>Fredrick-Aleksander-Myrvoll</xbar.author>
# <xbar.desc>Monitor and manage Ollama (Homebrew) – status, start/stop/restart, models, VRAM.</xbar.desc>
# <xbar.dependencies>bash,ollama,brew</xbar.dependencies>

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

OLLAMA_API="http://localhost:11434"
CURL=$(which curl)
SELF=$(cd "$(dirname "$0")" && pwd)/$(basename "$0")

LAUNCHD_LABEL="com.ollama.serve"
LAUNCHD_PLIST="$HOME/Library/LaunchAgents/$LAUNCHD_LABEL.plist"
LAUNCHCTL=$(which launchctl)

# ── Handle unload action ──
if [ "$1" = "unload" ] && [ -n "$2" ]; then
  $CURL -s "$OLLAMA_API/api/generate" -d "{\"model\": \"$2\", \"keep_alive\": 0}" > /dev/null 2>&1
  exit 0
fi

# ── Status check ──
if curl -s --max-time 2 "$OLLAMA_API" > /dev/null 2>&1; then
  RUNNING=true
else
  RUNNING=false
fi

# ── Running models ──
ACTIVE_MODELS=""
if $RUNNING; then
  ACTIVE_MODELS=$(curl -s --max-time 3 "$OLLAMA_API/api/ps" 2>/dev/null)
fi

ACTIVE_COUNT=0
if [ -n "$ACTIVE_MODELS" ]; then
  ACTIVE_COUNT=$(echo "$ACTIVE_MODELS" | grep -o '"name"' | wc -l | tr -d ' ')
fi

# ── Menu bar title ──
if $RUNNING; then
  if [ "$ACTIVE_COUNT" -gt 0 ]; then
    echo "ollama [$ACTIVE_COUNT] | color=#1B7F37" # Dark Green
  else
    echo "ollama | color=#8E8E93" # Grey
  fi
else
  echo "ollama | color=#8B0000" # Dark Red
fi

echo "---"

# ── Status section ──
if $RUNNING; then
  echo "✅ Ollama is Running | color=green size=14"
else
  echo "🔴 Ollama is Stopped | color=red size=14"
fi
echo "---"

# ── Service controls ──
echo "⚙️ Service"
if $RUNNING; then
  echo "-- 🔄 Restart | bash='bash' param1='-c' param2='$LAUNCHCTL bootout gui/$(id -u) $LAUNCHD_PLIST; sleep 1; $LAUNCHCTL bootstrap gui/$(id -u) $LAUNCHD_PLIST' terminal=false refresh=true"
  echo "-- ⏹️ Stop    | bash='$LAUNCHCTL' param1='bootout' param2='gui/$(id -u)' param3='$LAUNCHD_PLIST' terminal=false refresh=true"
else
  echo "-- ▶️ Start   | bash='$LAUNCHCTL' param1='bootstrap' param2='gui/$(id -u)' param3='$LAUNCHD_PLIST' terminal=false refresh=true"
fi

echo "---"

# ── Active models ──
if $RUNNING; then
  echo "🔥 Active Models"
  if [ "$ACTIVE_COUNT" -gt 0 ]; then
    echo "$ACTIVE_MODELS" | SELF="$SELF" python3 -c "
import sys, json, os
try:
    data = json.load(sys.stdin)
    self_path = os.environ['SELF']
    for m in data.get('models', []):
        name = m.get('name','?')
        size_b = m.get('size_vram', m.get('size', 0))
        size_gb = size_b / (1024**3)
        expires = m.get('expires_at','')[:19].replace('T',' ')
        print(f'-- {name}  ({size_gb:.1f} GB VRAM)  ⏳ {expires} | font=Menlo size=12')
        print(f'---- ⏏️ Unload | bash=\"{self_path}\" param1=unload param2=\"{name}\" terminal=false refresh=true')
except: print('-- (parse error) | color=red')
"
  else
    echo "-- No models loaded | color=gray"
  fi

  # ── Installed models ──
  echo "📦 Installed Models"
  MODELS=$(ollama list 2>/dev/null | tail -n +2)
  if [ -n "$MODELS" ]; then
    while IFS= read -r line; do
      NAME=$(echo "$line" | awk '{print $1}')
      SIZE=$(echo "$line" | awk '{print $3 $4}')
      echo "-- $NAME ($SIZE) | font=Menlo size=12"
      echo "---- ▶️ Run in Terminal | bash='ollama' param1='run' param2='$NAME' terminal=true"
      echo "---- 🗑 Remove | bash='ollama' param1='rm' param2='$NAME' terminal=true refresh=true"
    done <<< "$MODELS"
  else
    echo "-- No models installed | color=gray"
  fi

  echo "---"

  echo "🌐 Ollama Models | href=https://ollama.com/search"

  # ── Server info ──
  echo "📊 Info"
  VERSION=$(ollama --version 2>/dev/null | awk '{print $NF}')
  echo "-- Version: $VERSION | font=Menlo size=12"
  BREW_VER=$(brew info ollama 2>/dev/null | head -1)
  echo "-- Brew: $BREW_VER | font=Menlo size=12"
fi

echo "---"
echo "🔄 Refresh | refresh=true"
