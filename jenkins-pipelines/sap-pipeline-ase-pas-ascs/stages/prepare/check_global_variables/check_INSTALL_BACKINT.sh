#!/bin/bash

# ------------------------------------------------------------------
# Check if the variable is present. If not, send back default value
# ------------------------------------------------------------------
if [ -z "$INSTALL_BACKINT" ]; then
    echo "false"
    exit 0
fi

echo "$INSTALL_BACKINT"
exit 0