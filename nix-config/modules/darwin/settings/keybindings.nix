{ ... }: {
  # Set desired keybindings in keyboard shortcuts,
  # then use `defaults read com.apple.symbolichotkeys | pbcopy` paste into this file
  # use LLMs to fix the formatting.
  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        "7" = {
          enabled = true;
          value = {
            parameters = [65535 120 8650752];
            type = "standard";
          };
        };
        "8" = {
          enabled = true;
          value = {
            parameters = [65535 99 8650752];
            type = "standard";
          };
        };
        "9" = {
          enabled = false;
          value = {
            parameters = [65535 118 8650752];
            type = "standard";
          };
        };
        "10" = {
          enabled = false;
          value = {
            parameters = [65535 96 8650752];
            type = "standard";
          };
        };
        "11" = {
          enabled = false;
          value = {
            parameters = [65535 97 8650752];
            type = "standard";
          };
        };
        "12" = {
          enabled = false;
          value = {
            parameters = [65535 122 8650752];
            type = "standard";
          };
        };
        "13" = {
          enabled = false;
          value = {
            parameters = [65535 98 8650752];
            type = "standard";
          };
        };
        "15" = {
          enabled = false;
        };
        "16" = {
          enabled = false;
        };
        "17" = {
          enabled = false;
        };
        "18" = {
          enabled = false;
        };
        "19" = {
          enabled = false;
        };
        "20" = {
          enabled = false;
        };
        "21" = {
          enabled = false;
        };
        "22" = {
          enabled = false;
        };
        "23" = {
          enabled = false;
        };
        "24" = {
          enabled = false;
        };
        "25" = {
          enabled = false;
        };
        "26" = {
          enabled = false;
        };
        "27" = {
          enabled = false;
          value = {
            parameters = [96 50 1048576];
            type = "standard";
          };
        };
        "28" = {
          enabled = false;
          value = {
            parameters = [51 20 1179648];
            type = "standard";
          };
        };
        "29" = {
          enabled = false;
          value = {
            parameters = [51 20 1441792];
            type = "standard";
          };
        };
        "30" = {
          enabled = false;
          value = {
            parameters = [52 21 1179648];
            type = "standard";
          };
        };
        "31" = {
          enabled = false;
          value = {
            parameters = [52 21 1441792];
            type = "standard";
          };
        };
        "32" = {
          enabled = false;
          value = {
            parameters = [65535 126 8650752];
            type = "standard";
          };
        };
        "33" = {
          enabled = false;
          value = {
            parameters = [65535 125 8650752];
            type = "standard";
          };
        };
        "36" = {
          enabled = false;
          value = {
            parameters = [65535 103 8388608];
            type = "standard";
          };
        };
        "52" = {
          enabled = false;
          value = {
            parameters = [100 2 1572864];
            type = "standard";
          };
        };
        "53" = {
          enabled = false;
          value = {
            parameters = [65535 107 8388608];
            type = "standard";
          };
        };
        "54" = {
          enabled = false;
          value = {
            parameters = [65535 113 8388608];
            type = "standard";
          };
        };
        "57" = {
          enabled = false;
          value = {
            parameters = [65535 100 8650752];
            type = "standard";
          };
        };
        "59" = {
          enabled = false;
          value = {
            parameters = [65535 96 9437184];
            type = "standard";
          };
        };
        "60" = {
          enabled = false;
          value = {
            parameters = [32 49 262144];
            type = "standard";
          };
        };
        "61" = {
          enabled = false;
          value = {
            parameters = [32 49 786432];
            type = "standard";
          };
        };
        "65" = {
          enabled = false;
          value = {
            parameters = [32 49 1572864];
            type = "standard";
          };
        };
        "79" = {
          enabled = false;
          value = {
            parameters = [65535 123 8650752];
            type = "standard";
          };
        };
        "80" = {
          enabled = true;
          value = {
            parameters = [65535 123 8781824];
            type = "standard";
          };
        };
        "81" = {
          enabled = false;
          value = {
            parameters = [65535 124 8650752];
            type = "standard";
          };
        };
        "82" = {
          enabled = true;
          value = {
            parameters = [65535 124 8781824];
            type = "standard";
          };
        };
        "98" = {
          enabled = false;
          value = {
            parameters = [47 44 1179648];
            type = "standard";
          };
        };
        "118" = {
          enabled = true;
          value = {
            parameters = [49 18 917504];
            type = "standard";
          };
        };
        "119" = {
          enabled = true;
          value = {
            parameters = [50 19 917504];
            type = "standard";
          };
        };
        "120" = {
          enabled = true;
          value = {
            parameters = [51 20 917504];
            type = "standard";
          };
        };
        "121" = {
          enabled = true;
          value = {
            parameters = [52 21 917504];
            type = "standard";
          };
        };
        "122" = {
          enabled = true;
          value = {
            parameters = [53 23 917504];
            type = "standard";
          };
        };
        "123" = {
          enabled = true;
          value = {
            parameters = [54 22 917504];
            type = "standard";
          };
        };
        "124" = {
          enabled = true;
          value = {
            parameters = [55 26 917504];
            type = "standard";
          };
        };
        "125" = {
          enabled = true;
          value = {
            parameters = [56 28 917504];
            type = "standard";
          };
        };
        "126" = {
          enabled = true;
          value = {
            parameters = [57 25 917504];
            type = "standard";
          };
        };
        "127" = {
          enabled = true;
          value = {
            parameters = [48 29 917504];
            type = "standard";
          };
        };
        "162" = {
          enabled = false;
          value = {
            parameters = [65535 96 9961472];
            type = "standard";
          };
        };
        "164" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "175" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "184" = {
          enabled = false;
          value = {
            parameters = [53 23 1179648];
            type = "standard";
          };
        };
        "190" = {
          enabled = false;
          value = {
            parameters = [113 12 8388608];
            type = "standard";
          };
        };
        "215" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "216" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "217" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "218" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "219" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "222" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "223" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "224" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "225" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "226" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "227" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "228" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "229" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "230" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "231" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
        "232" = {
          enabled = false;
          value = {
            parameters = [65535 65535 0];
            type = "standard";
          };
        };
      };
    };
  };
}
