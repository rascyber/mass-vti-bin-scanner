
# 🔍 New Tool Release: SharePoint `_vti_bin` Mass Scanner

🚨 **TL;DR:** I just released a new mass-scan tool to discover and enumerate exposed **Microsoft SharePoint SOAP endpoints** like `lists.asmx`, `webs.asmx`, and others. It's open source and available here 👉 [github.com/rascyber/mass-vti-bin-scanner](https://github.com/rascyber/mass-vti-bin-scanner)

---

## 🧠 What It Does

During a recent bug bounty recon project, I encountered multiple Microsoft SharePoint instances exposing sensitive SOAP web services via the `_vti_bin/*.asmx` endpoints. These services can be abused for:

- SharePoint **enumeration** of lists/libraries
- Detection of **publicly accessible internal WSDLs**
- Scanning for **vulnerable endpoints** affected by known CVEs like:
  - `CVE-2023-21742`
  - `CVE-2020-0932`
  - `CVE-2023-38344`
  - `CVE-2020-0646`
  - `CVE-2021-31950`

---

## ⚙️ Features

✅ Mass-scan subdomains for `_vti_bin/*.asmx`  
✅ Includes PoC template to test with [Nuclei](https://github.com/projectdiscovery/nuclei)  
✅ Generates auto-evidence files for reporting  
✅ Includes **rebuild.sh** for quick setup  
✅ Includes **YAML templates for known CVEs**

---

## 📦 GitHub Repository

📁 [https://github.com/rascyber/mass-vti-bin-scanner](https://github.com/rascyber/mass-vti-bin-scanner)

Includes:
- `mass-vti-bin-scanner.sh`
- `asmx-payloads.txt`
- `sharepoint-asmx-cves.yaml`
- Auto PoC + screenshot collection

---

## 🧪 Use Case: Bug Bounty, Red Team, Recon

If you're into:
- 🔍 Asset discovery and recon
- 🎯 CVE exploitation
- 🛡️ Internal VAPT or compliance checks (e.g. PCI DSS)  
…this tool fits perfectly in your workflow.

---

## 🙌 Acknowledgements

Shoutout to the researchers who initially explored SharePoint endpoint enumeration and helped raise awareness around exposed `lists.asmx`, `webs.asmx`, and `permissions.asmx` services.

---

## 💬 Feedback & Collaboration

If you find it useful, star ⭐ the repo, and feel free to raise an issue or PR if you have improvements or want to add new CVEs.

---

🧞‍♂️ **Stay curious, stay secure.**  
— *@rascyber (Genie)*  
🔗 [github.com/rascyber/mass-vti-bin-scanner](https://github.com/rascyber/mass-vti-bin-scanner)
