# Actividad 18 - Proyecto mi-calculadora

En esta actividad 18 continuamos con el desarrollo y mejora del proyecto **mi-calculadora**, que venimos trabajando durante los días anteriores.  

El objetivo principal de esta etapa fue integrar la automatización del flujo de trabajo mediante GitHub Actions, utilizando un **runner self-hosted** para ejecutar los tests y validar el correcto funcionamiento de la aplicación.  

También configuramos un workflow para construir y probar la imagen Docker de la aplicación directamente en nuestro entorno local, asegurando así la correcta construcción y despliegue del contenedor.

## Detalles de la actividad

- Creamos un archivo workflow `.github/workflows/self-hosted.yml` para ejecutar tests con `pytest` en nuestro runner local.
- Configuramos el entorno virtual dentro del workflow para instalar las dependencias desde `requirements.txt`.
- Solucionamos problemas relacionados con el path de importación de los módulos para que los tests corran correctamente.
- Implementamos un workflow adicional `.github/workflows/docker.yml` que:
  - Construye la imagen Docker de la aplicación.
  - Levanta un contenedor basado en esa imagen.
  - Ejecuta un chequeo de salud mediante un `curl` al endpoint `/health`.
  - Detiene y elimina el contenedor luego de la prueba.

## Reflexiones

Este avance nos permitió profundizar en la integración continua y en la automatización del ciclo de vida de desarrollo, combinando pruebas automáticas y despliegues en contenedores Docker, todo utilizando un runner self-hosted para tener mayor control del entorno.
