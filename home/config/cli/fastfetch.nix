{
  xdg.configFile."fastfetch/config.jsonc".text = ''
  {
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
          "source": "~/.config/fastfetch/planet",
          "color": {
              "1": "blue",
              "2": "magenta"
          },
          "type": "file",
          "padding": {
              "top": 0,
              "left": 0
          }
      },
    "display": {
      "separator": "    "
    },
    "modules": [
      {
        "type": "custom",
        "format": "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
      },
      "break",
      {
        "type": "os",
        "key": "  ",
        "keyColor": "blue"
      },
      {
        "type": "kernel",
        "key": "  ",
        "keyColor": "white"
      },
      {
        "type": "packages",
        "key": "  󰮯",
        "keyColor": "yellow"
      },
      {
        "type": "wm",
        "key": "  󰨇",
        "keyColor": "blue"
    },
    {
      "type": "terminal",
      "key": "  ",
      "keyColor": "magenta"
    },
    {
      "type": "shell",
      "key": "  ",
      "keyColor": "yellow"
    },
    "break",
    {
      "type": "custom",
      "format": "┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫"
    },
    "break",
    {
      "type": "host",
      "key": "  ",
      "keyColor": "bright_blue"
    },
    {
      "type": "cpu",
      "key": "  ",
      "keyColor": "bright_green"
    },
    {
      "type": "gpu",
      "key": "  󱤓",
      "keyColor": "red"
    },
    {
      "type": "memory",
      "key": "  󰍛",
      "keyColor": "bright_yellow"
    },
    {
      "type": "disk",
      "key": "  ",
      "keyColor": "bright_cyan"
    },
    "break",
    {
      "type": "custom",
      "format": "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    }
  ]
}
'';

xdg.configFile."fastfetch/planet".text = ''
                                                 ,o88888 
                                              ,o8888888' 
                        ,:o:o:oooo.        ,8O88Pd8888"  
                    ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    
                  ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      
                 , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        
                , ..:.::o:ooOoOO8O888O8O,COCOO"          
               , . ..:.::o:ooOoOOOO8OOOOCOCO"            
                . ..:.::o:ooOoOoOO8O8OCCCC"o             
                   . ..:.::o:ooooOoCoCCC"o:o             
                   . ..:.::o:o:,cooooCo"oo:o:            
                `   . . ..:.:cocoooo"'o:o:::'            
                .`   . ..::ccccoc"'o:o:o:::'             
               :.:.    ,c:cccc"':.:.:.:.:.'              
             ..:.:"'`::::c:"'..:.:.:.:.:.'               
           ...:.'.:.::::"'    . . . . .'                 
          .. . ....:."' `   .  . . \'\'                    
        . . . ...."'                                     
        .. . ."'                                         
       .                                                 
 '';
}
