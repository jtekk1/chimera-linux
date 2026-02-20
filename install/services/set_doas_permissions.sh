#!/bin/bash

TARGET_USER=$(whoami)
DOAS_CONF="/etc/doas.conf"

RULE_UPDATE="permit nopass $TARGET_USER as root cmd apk args update"
RULE_UPGRADE="permit nopass $TARGET_USER as root cmd apk args upgrade -s"

check_if_doas_rule_exists() {
    local rule="$1"

    if grep -qxF "$rule" "$DOAS_CONF" 2>/dev/null; then
        echo "Rule already exists: $rule"
    else
        echo "Adding rule: $rule"
        echo "$rule" | doas tee -a "$DOAS_CONF" > /dev/null
    fi
}

check_if_doas_rule_exists "$RULE_UPDATE"
check_if_doas_rule_exists "$RULE_UPGRADE"

