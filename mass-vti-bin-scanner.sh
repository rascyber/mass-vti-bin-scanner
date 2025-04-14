#!/bin/bash
# mass-vti-bin-scanner.sh
# Author: @rascyber (Genie)
# Description: Mass-scan for _vti_bin/*.asmx endpoints across subdomains
# Usage: ./mass-vti-bin-scanner.sh subs.txt > vti_endpoints_found.txt

# Load extended SharePoint ASMX wordlist from file if available
ASM_LIST="asmx-payloads.txt"
if [[ -f "$ASM_LIST" ]]; then
  mapfile -t ASMXS < "$ASM_LIST"
else
  ASMXS=(
    "_vti_bin/webs.asmx"
    "_vti_bin/lists.asmx"
    "_vti_bin/permissions.asmx"
    "_vti_bin/sitedata.asmx"
    "_vti_bin/sites.asmx"
    "_vti_bin/users.asmx"
    "_vti_bin/usergroup.asmx"
    "_vti_bin/dspsts.asmx"
    "_vti_bin/views.asmx"
    "_vti_bin/versions.asmx"
    "_vti_bin/workflow.asmx"
  )
fi

# Check input
if [[ ! -f "$1" ]]; then
  echo "[!] Usage: $0 <subdomains.txt>"
  exit 1
fi

INPUT="$1"
HEADER="X-HackerOne-Research: rascyber"

while read -r DOMAIN; do
  for ASM in "${ASMXS[@]}"; do
    URL="https://$DOMAIN/_vti_bin/$ASM"
    RESPONSE=$(curl -sk -m 10 -A "Mozilla/5.0" -H "$HEADER" "$URL" | grep -i "<definitions\|<wsdl")
    if [[ ! -z "$RESPONSE" ]]; then
      echo "[+] Found: $URL"
    fi
  done
done < "$INPUT"
