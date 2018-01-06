#!/usr/bin/env sh
set -e

# Overwrite customised revealjs CSS, fonts, etc.
cp -rv /revealjs-files /revealjs
# chown -R slides /revealjs

grunt serve
