#!/bin/bash
# mass-vti-bin-scanner.sh
# Author: @rascyber (Genie)
# Description: Mass-scan for _vti_bin/*.asmx endpoints across subdomains
# Usage: ./mass-vti-bin-scanner.sh subs.txt > found-vti-endpoints.txt

# Load extended SharePoint ASMX wordlist from file if available
ASM_LIST="asmx-payloads.txt"
if [[ -f "$ASM_LIST" ]]; then
  ASMXS=()
  while IFS= read -r line || [ -n "$line" ]; do
    ASMXS+=("$line")
  done < "$ASM_LIST"
else
  ASMXS=(
    "webs.asmx"
    "lists.asmx"
    "permissions.asmx"
    "sitedata.asmx"
    "sites.asmx"
    "users.asmx"
    "usergroup.asmx"
    "dspsts.asmx"
    "views.asmx"
    "versions.asmx"
    "workflow.asmx"
  )
fi

# Check input
if [[ ! -f "$1" ]]; then
  echo "[!] Usage: $0 <subdomains.txt>"
  exit 1
fi

INPUT="$1"
HEADER="X-HackerOne-Research: rascyber"

while read -r DOMAIN || [[ -n "$DOMAIN" ]]; do
  for ASM in "${ASMXS[@]}"; do
    URL="https://$DOMAIN/_vti_bin/$ASM"
    RESPONSE=$(curl -sk -m 10 -A "Mozilla/5.0" -H "$HEADER" "$URL" | grep -i "<definitions\\|<wsdl")
    if [[ ! -z "$RESPONSE" ]]; then
      echo "[+] Found: $URL"
    fi
  done
done < "$INPUT"
