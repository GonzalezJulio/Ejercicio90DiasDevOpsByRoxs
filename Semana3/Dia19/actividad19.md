# actividad19

Proyecto full-stack con backend en Python (Flask), base de datos PostgreSQL y NGINX como reverse proxy, orquestado con Docker Compose.

## Resumen

Esta aplicación está diseñada para ser desplegada y monitoreada fácilmente usando Docker Compose. Cuenta con dos ambientes configurados: **staging** y **producción**, cada uno con su propio archivo `docker-compose` para levantar los servicios en puertos separados y con bases de datos independientes.

El deploy se automatiza mediante workflows de GitHub Actions que utilizan un runner self-hosted configurado en mi máquina local. Esto permite que cada push a las ramas `develop` y `main` active el despliegue automático en los ambientes correspondientes.

Además, la app incluye endpoints para health checks y un script simple de monitoreo (`check-app.sh`) para verificar el estado de la aplicación en cualquier momento.
