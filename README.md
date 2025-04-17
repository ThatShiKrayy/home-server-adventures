# 🧠 Scott Worley's Homelab Stack
<<<<<<< HEAD
=======
![Docker Compose](https://img.shields.io/badge/docker--compose-modular-blue?logo=docker)
![License](https://img.shields.io/github/license/ThatShiKrayy/home-server-adventures)
![Last Commit](https://img.shields.io/github/last-commit/ThatShiKrayy/home-server-adventures)
![Status](https://img.shields.io/badge/status-in_progress-yellow)
![Built With](https://img.shields.io/badge/built%20with-Ansible%20%7C%20Docker%20%7C%20CrowdSec-0e7a0d)
>>>>>>

> A modular, secure, and obsessively documented Docker Compose-based homelab.  
> Built to run 24/7, survive the apocalypse, and make Plex purr.

![Homelab Stack Banner](img/readme-banner.png)

---

## 📦 What This Is

This repo contains my **Docker Compose stack** for my personal homelab, organized by category and designed to be portable, maintainable, and secure.

It includes everything from media automation and personal dashboards to reverse proxying and self-hosted utilities—with secrets and security configs abstracted out.

---

## 🧱 Architecture

- **Modular YAMLs** per service (`compose/homeserver/`)
- **Grouped by function**: MEDIA, PVRS, PROXY, DOWNLOADERS, etc.
- **Traefik** as reverse proxy with DNS-01 Cloudflare TLS
- **CrowdSec** for dynamic firewall defense
- **Secrets** stored in `/secrets/` and excluded from version control
- **`.env` at root** to drive paths and values across services

---

## 📊 Diagram

```
+---------------------+
|     User Access     |
+----------+----------+
           |
           v
+---------------------+      +-------------------+
|      Cloudflare     | ---> |     DNS Records   |
+---------------------+      +-------------------+
           |
           v
+---------------------+
|      Traefik        | <--> CrowdSec (LAPI)
|  Reverse Proxy      |
+----+----+----+------+
     |    |    |
     |    |    +--> Plex
     |    +--> Overseerr
     +--> Grocy
     ...  (and more)
```

---

## 🧭 File Structure

```plaintext
.
├── compose/
│   └── homeserver/
│       ├── MEDIA/
│       ├── PVRS/
│       ├── PROXY/
│       └── ...
├── secrets/              # Docker secrets (not included)
├── secrets-template/     # Example structure for secrets
├── .env.example          # Template .env
├── docker-compose-homeserver.yml
└── README.md
```

---

## 🚀 Services Included

| Category    | Apps Included |
|-------------|----------------|
| **MEDIA**   | Plex, Jellyfin, Audiobookshelf, Tautulli, Bazarr |
| **PVRS**    | Sonarr, Radarr, Lidarr, Readarr, Prowlarr, Whisparr, Suwayomi |
| **PROXY**   | Traefik, Socket Proxy, CrowdSec |
| **UTILITY** | Grocy, AdGuard, Home Assistant, Mealie |
| **DOWNLOADERS** | SabNZBD |
| **LOGGING** | Grafana, Loki, Promtail, Syslog-ng |
| **DATABASE** | Postgres, MariaDB, Redis |

---

## ⚙️ Usage

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/homelab-compose.git
cd homelab-compose

# Copy and edit your environment variables
cp .env.example .env
nano .env

# Bring the stack up
docker compose -f docker-compose-homeserver.yml up -d
```

---

## 🔐 Secrets

All secrets (API keys, tokens, passwords) are stored in individual files in `secrets/`, and never committed to Git.

**Example:**

```bash
secrets/
├── plex_token
├── cloudflare_api_token
├── traefik_crowdsec_api
└── ...
```

> See `secrets-template/` for placeholders you can use to replicate this structure.

---

## 🛡️ Security

- Docker secrets stored with `0400` permissions
- TLS with DNS-01 challenge via Cloudflare
- CrowdSec integrated into Traefik with bouncer
- API/Dashboard routes protected by middleware or firewall rules

---

## 🧠 Philosophy

> “I build like it’s production, even if it’s just for my living room.”

This stack is designed to showcase security-first design, composability, and clean documentation—for anyone wanting to roll their own infrastructure like a pro.

---

## 🛠️ Tools You’ll Want

- Docker & Docker Compose plugin
- Ansible (optional)
- Gitleaks (for pre-push scans)
- Uptime Kuma, Dashy or Homepage (dashboard tools)

---

## 📜 License

MIT. Use, fork, adapt, and remix as you like.

---

## ⚡ Author

**Scott Worley** – [scott.worleys.us](https://scott.worleys.us)

Built with caffeine, curiosity, and a deeply unhealthy relationship with logs.
