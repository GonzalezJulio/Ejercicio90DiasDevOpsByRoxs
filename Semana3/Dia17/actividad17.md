### 🧪 **Actividad 17 - Mi Calculadora Flask**

Este proyecto consiste en una aplicación web desarrollada con **Flask**, que expone diferentes operaciones matemáticas a través de una API REST. Además, la aplicación se dockeriza y se integra con GitHub Actions para ejecutar pruebas y construir la imagen automáticamente.

---

### 📦 **Características principales**

- API Flask con las siguientes rutas:
  - `/` — Mensaje de bienvenida
  - `/sumar/<a>/<b>` — Suma dos números
  - `/restar/<a>/<b>` — Resta dos números
  - `/dividir/<a>/<b>` — Realiza división con manejo de división por cero
  - `/es-primo/<n>` — Indica si un número es primo
  - `/health` — Ruta de salud para el contenedor

- Dockerfile optimizado basado en `python:3.11-slim`
- Workflow CI/CD con GitHub Actions:
  - Construcción y prueba de imagen Docker
  - Push a GitHub Container Registry (`ghcr.io`)
  - Verificación automática de endpoints con `curl`

---

### 🐳 **Comandos útiles**

```bash
# Construir imagen
docker build -t mi-calculadora-flask .

# Ejecutar contenedor
docker run -p 5000:5000 mi-calculadora-flask
```

---

### ✅ **Workflow CI**

Ubicado en `.github/workflows/ci.yml`, el workflow:

- Se ejecuta en `push` a las ramas `main`, `develop`, `Dia17`
- Corre tests automáticos dentro de un contenedor
- Publica la imagen en GHCR (si no es un PR)
