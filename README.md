# 🧠 Home Server Adventures

![Docker Compose](https://img.shields.io/badge/built%20with-Docker%20Compose-blue)
![Version](https://img.shields.io/badge/version-1.0-green)
![License](https://img.shields.io/github/license/ThatShiKrayy/home-server-adventures)

Welcome to my homelab — a fully modular, containerized self-hosting environment built with Docker Compose, Traefik, and strict security best practices. This project serves as both a personal infrastructure and a professional showcase of secure, scalable homelab deployment.

---

## 📑 Table of Contents
- [🎯 Project Goals](#-project-goals)
- [🧱 Stack Overview](#-stack-overview)
- [🔐 Security Practices](#-security-practices)
- [📁 Directory Structure](#-directory-structure)
- [🚀 Deployed Services](#-deployed-services)
- [📊 Architecture Diagram](#-architecture-diagram)
- [⚙️ Getting Started](#️-getting-started)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## 🎯 Project Goals

- Showcase a secure, production-style home server deployment using modern DevOps principles
- Maintain modular, readable, and reusable Docker Compose files
- Secure all services with DNS-01 ACME certs and Traefik middleware
- Automate deployment with Ansible (future phase)
- Document the architecture for transparency and collaboration

---

## 🧱 Stack Overview

| Category     | Description                                                                 |
|--------------|-----------------------------------------------------------------------------|
| **Media**    | Hosts and streams personal media libraries                                 |
| **PVRS**     | Automates media acquisition and management                                 |
| **Proxy**    | Handles secure routing, TLS termination, and reverse proxying              |
| **Security** | Provides adaptive protection against threats and suspicious traffic        |
| **Utility**  | Supports day-to-day operations (inventory, dashboards, etc.)               |

---

## 🔐 Security Practices

- All secrets are abstracted into individual files inside the `secrets/` folder
- File permissions are set to `0400` for maximum security
- `.env` at the root manages non-sensitive variables and pathing
- No secrets or tokens are hardcoded in Compose files
- Traefik is locked down using SNI strict mode, custom TLS ciphers, and Cloudflare DNS-01 challenges
- API dashboards and web entrypoints are gated behind middleware

---

## 📁 Directory Structure

```bash
docker/
├── docker-compose-homeserver.yml   # Root-level orchestration file
├── compose/                        # Modular compose service files
│   ├── media/
│   ├── proxy/
│   ├── pvrs/
│   ├── utility/
│   └── security/
├── secrets/                        # Individual secret files (0400 permissions)
├── shared/                         # Shared configs, certs, etc.
├── appdata/                        # Bind mounts for persistent container data
└── .env                            # Path variables (no secrets)
```
---

## 🚀 Deployed Services

| Category     | Services                          |
|--------------|-----------------------------------|
| **Media**    | Plex, Jellyfin, Overseerr          |
| **PVRS**     | Radarr, Sonarr, SabNZBD            |
| **Proxy**    | Traefik                            |
| **Security** | CrowdSec                           |
| **Utility**  | Grocy                              |

---

## 📊 Architecture Diagram

[![](https://mermaid.ink/img/pako:eNp1U11v2jAU_SvRfVqlwPJByMfDpLVIVSexISid1KYPJrmA1cRGjrPBgP8-J4HGAeEn33PPuR9H9h4SniJEsBJkszaeRzEz1CnKRQNM8Q-KAo2J4Ntdk6vOsyC4pB8NgCyN2YVujCklLX-S4baNfmCW7ZaUtcivugsKcbvi5GU6awVTkpIzuzozzroxWfx8vR_dLjeXNKNSW-lR8GR3mz_DpBQdwYPgf1MFX2nmBQqj1_t2-I0LY_506Lp1CmrClJcSC0Pyg-aQRrhwSs9cOKandG90XPeog-te6YmTJU3ivG49-JgzKrkoLnbrcNSTkZhIxfmeZVd-jogkxgvPyhyL1tMT8PblnrLUGPOSySIyyGaTKvrXu_crr1XpetSTEEz1kGkKkRQlmpCjyEkVwr6ixyDXmGMMkboqjz5iiNlRaTaEvXKen2WCl6s1REuSFSoqq-Y4okQNnn-iQg2B4qGaECLfCuoiEO1hC1Fv6PUt1xkMfce3LNfzfBN2ENm233fDwPMGjuvZw8EgOJrwr-5r960gsAI3HFqOFYah7ZigfpCyeNx8z4SzJV3B8T95-iGC?type=png)](https://mermaid.live/edit#pako:eNp1U11v2jAU_SvRfVqlwPJByMfDpLVIVSexISid1KYPJrmA1cRGjrPBgP8-J4HGAeEn33PPuR9H9h4SniJEsBJkszaeRzEz1CnKRQNM8Q-KAo2J4Ntdk6vOsyC4pB8NgCyN2YVujCklLX-S4baNfmCW7ZaUtcivugsKcbvi5GU6awVTkpIzuzozzroxWfx8vR_dLjeXNKNSW-lR8GR3mz_DpBQdwYPgf1MFX2nmBQqj1_t2-I0LY_506Lp1CmrClJcSC0Pyg-aQRrhwSs9cOKandG90XPeog-te6YmTJU3ivG49-JgzKrkoLnbrcNSTkZhIxfmeZVd-jogkxgvPyhyL1tMT8PblnrLUGPOSySIyyGaTKvrXu_crr1XpetSTEEz1kGkKkRQlmpCjyEkVwr6ixyDXmGMMkboqjz5iiNlRaTaEvXKen2WCl6s1REuSFSoqq-Y4okQNnn-iQg2B4qGaECLfCuoiEO1hC1Fv6PUt1xkMfce3LNfzfBN2ENm233fDwPMGjuvZw8EgOJrwr-5r960gsAI3HFqOFYah7ZigfpCyeNx8z4SzJV3B8T95-iGC)   

---

## ⚙️ Getting Started

Prerequisites
- Linux-based system (tested on Asahi Linux)
- Docker & Docker Compose (v2+)
- Registered domain name
- Cloudflare account with API token (for ACME DNS-01)
- Deployment
- git clone https://github.com/ThatShiKrayy/home-server-adventures.git
- cd home-server-adventures/docker
- cp .env.example .env       # Edit paths and domain details
- chmod 0400 secrets/*       # Secure your secrets
- docker compose -f docker-compose-homeserver.yml up -d

---

## 🤝 Contributing

Suggestions, issues, and contributions are welcome! Open a pull request or file an issue — feedback is how we grow. 🚀

---

## 📄 License

This project is licensed under the MIT License. See LICENSE for details.

---

## 🔭 Future Plans

- Add Ansible automation and secrets vaulting
- Integrate monitoring (Grafana/Prometheus or Uptime Kuma)
- Explore Terraform for DNS provisioning
- Build a Dashy homepage for UI-based navigation
