# SharePoint `_vti_bin` Mass Scanner

A lightweight Bash tool to mass-scan SharePoint WSDL (`*.asmx`) services on scoped bug bounty subdomains.

## Features
- 🧠 Uses common `_vti_bin/*.asmx` endpoint list (customizable)
- ✅ Validates exposed WSDL responses (`<definitions>`, `<wsdl>`)
- 🧩 Works great with bug bounty/VDP scanning
- 🧪 Outputs only valid targets for PoC or reporting
- ☁️ Header ready for `HackerOne` (customizable)

## Requirements
- `bash`, `curl`, `grep`
- `subs.txt` — list of domains/subdomains (one per line)
- `asmx-payloads.txt` — list of ASMX endpoints (optional, default is used)

## Usage
```bash
chmod +x mass-vti-bin-scanner.sh
./mass-vti-bin-scanner.sh subs.txt > found-vti-endpoints.txt
```

## PoC Detection Output
```
[+] Found: https://XXXXXXXX/_vti_bin/webs.asmx
[+] Found: https://XXXXXXXX/_vti_bin/permissions.asmx
```

## Nuclei PoC Template
See `sharepoint-asmx-cves.yaml` for reproducible scanner config with CVE coverage.
