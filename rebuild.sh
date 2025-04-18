#!/bin/bash
# rebuild.sh - recreate structure and set permissions

echo "[*] Rebuilding project structure..."
mkdir -p sharepoint-vti-bin-scanner
mv mass-vti-bin-scanner.sh sharepoint-vti-bin-scanner/
mv sharepoint-asmx-cves.yaml sharepoint-vti-bin-scanner/
chmod +x sharepoint-vti-bin-scanner/mass-vti-bin-scanner.sh
echo "[+] Done. You can now run the scanner using: ./sharepoint-vti-bin-scanner/mass-vti-bin-scanner.sh subs.txt"
