Roxs Voting App - CI/CD Pipeline 🚀
Este proyecto es una app de votación Dockerizada (vote, worker, result, db, redis) con un pipeline completo de CI/CD usando GitHub Actions, runners self-hosted y monitorización.

🛠️ ¿Qué hicimos?
✅ Dockerización:
La app fue separada en servicios con Docker Compose para entornos de desarrollo, staging y producción.

✅ CI/CD con GitHub Actions:

ci.yml: ejecuta tests para cada servicio.

deploy-staging.yml: despliega automáticamente a staging al hacer push en develop.

deploy-production.yml: despliega a producción con approval al hacer push en main.

health-check.yml: monitoreo cada 30 minutos de los servicios en producción.

✅ Runners Self-Hosted:
Configuramos 2 runners:

Uno para staging.

Otro para production.

✅ Scripts Útiles:

scripts/deploy.sh: despliega localmente o remotamente por entorno (development, staging, production).

scripts/health-check.sh: verifica si el servicio /health está respondiendo.

✅ Monitoreo Activo:

Workflow health-check.yml se ejecuta cada 30 minutos y reporta errores si algún servicio no responde.

