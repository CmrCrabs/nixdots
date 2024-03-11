local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.fsharp = {
  install_info = {
    url = "https://github.com/Nsidorenco/tree-sitter-fsharp",
    branch = "develop",
    files = {"src/scanner.cc", "src/parser.c" },
    generate_requires_npm = true,
    requires_generate_from_grammar = true
  },
  filetype = "fsharp",
}
