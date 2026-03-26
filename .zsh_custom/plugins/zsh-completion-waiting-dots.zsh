# Define the function that prints dots
expand-or-complete-with-dots() {
  # Disable line wrapping temporarily to prevent prompt corruption
  [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti rmam
  
  # Print the dots (customize the string or color here)
  print -Pn "%{%F{red}......%f%}"
  
  # Restore line wrapping
  [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti smam
  
  # Perform the actual completion
  zle expand-or-complete
  
  # Redraw the prompt to clear the dots after completion finishes
  zle reset-prompt
}

# Register it as a widget and bind it to the Tab key
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
