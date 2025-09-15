— Día 24 del Reto 90 Días DevOps
Tema: Terraform con el provider Docker — Stack completo

✅ Objetivo del día
Implementar infraestructura completa en local usando Terraform y el provider Docker, para levantar un stack con múltiples servicios:

PostgreSQL

Redis

Nginx

(opcional) otros contenedores

🧱 Componentes creados
docker_network personalizada para que los servicios se comuniquen

docker_image para cada servicio, usando imágenes oficiales

docker_container para PostgreSQL, Redis y Nginx

Volúmenes persistentes para las bases de datos

🧪 Resultado esperado
Un stack Docker orquestado desde Terraform con:

Servicios interconectados por red

Bases de datos persistentes

Proxy Nginx funcionando

Ideal para practicar microservicios locales sin Docker Compose.

