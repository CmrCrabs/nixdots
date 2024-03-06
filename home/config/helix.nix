{
  xdg.configFile."helix/config.toml".text = ''
    theme = "base16_transparent"

    [editor.file-picker]
    hidden = false
    
    [editor.cursor-shape]
    insert = "bar"
    normal = "block"
    select = "underline"
    
    [editor]
    auto-save = true
    auto-completion = true
    line-number = "relative"
  '';
}
