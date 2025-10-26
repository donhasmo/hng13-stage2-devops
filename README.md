# hng13-stage2-devops
DevOps Intern Stage 2 Task -  Blue/Green with Nginx Upstreams (Auto-Failover + Manual Toggle

# Blue/Green Node.js Deployment Behind Nginx

This repository demonstrates a Blue/Green deployment setup using **Docker Compose** and **Nginx**.
The Nginx container routes traffic to either the Blue or Green Node.js app, based on the `ACTIVE_POOL` environment variable.

---

## Project Structure

.
├── nginx/
│ ├── nginx.conf.template
│ └── docker-entrypoint.sh
├── docker-compose.yml
├── .env.example
└── README.md


---

## Prerequisites
- Docker installed
- Docker Compose installed

---

## How to Run:
   ```
   bash
   git clone https://github.com/donhasmo/hng13-stage2-devops.git
   cd hng13-stage2-devops
   cp .env.example .env
   Edit .env to switch active pool: ACTIVE_POOL=green
   docker-compose up -d
   Visit: App URL → http://localhost:8080
   ```
## Switching Between Blue and Green:
```
docker-compose down
Change ACTIVE_POOL in .env (blue to green)
docker-compose up -d
```
## Verification:
```
curl -s -I http://localhost:8080 | grep X-App-Pool
```

## Cleanup:
```
docker-compose down -v
```

