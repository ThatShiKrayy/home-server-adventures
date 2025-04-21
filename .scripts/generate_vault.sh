#!/bin/bash

# Set the path to your secrets directory
SECRETS_DIR="./secrets"
VAULT_FILE="vault.yml"

# Start the YAML file
echo "# Auto-generated vault file" > "$VAULT_FILE"

# Loop through each file in the secrets directory
for file in "$SECRETS_DIR"/*; do
  if [[ -f "$file" ]]; then
    key=$(basename "$file")
    value=$(<"$file")
    # Escape any quotes or special characters
    safe_value=$(printf '%s' "$value" | sed 's/"/\\"/g')
    echo "$key: \"$safe_value\"" >> "$VAULT_FILE"
  fi
done

echo "Vault file created at: $VAULT_FILE"
