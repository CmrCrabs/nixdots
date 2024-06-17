{ pkgs, ...}:
pkgs.writeShellScriptBin "colors" ''
#!/usr/bin/env bash

# Author: crshd
# Source: http://crunchbang.org/forums/viewtopic.php?pid=128584#p128584

echo

for f in {0..6}; do
	echo -en "\033[$((f+41))m\033[$((f+30))m██▓▒░"
done
echo -en "\033[37m██\n"
''

