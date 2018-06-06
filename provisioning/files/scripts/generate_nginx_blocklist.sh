#!/bin/bash
# see blocklist by @fliphess
# https://gist.github.com/fliphess/fb0b23c967d4f6d0a9e7

USERAGENTS="$(cat botlist | tr "\n" "|")"
REGEX="$(echo $USERAGENTS | sed -e 's/\ /\\ /g' | sed -e 's/|$//')"

echo -e "if (\$http_user_agent ~* ($REGEX) ) {"
echo -e "    return 410;"
echo -e "}"
