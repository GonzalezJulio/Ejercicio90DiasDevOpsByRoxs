# 📘 Actividad 7 - Desafío Final Semana 2: Roxs Voting App Dockerizada

## 🎯 Objetivo

Dockerizar y levantar por completo la aplicación distribuida `roxs-voting-app`, utilizando contenedores individuales para cada componente y orquestación con **Docker Compose**.

---

## 📂 Estructura del Proyecto

```
roxs-voting-app/
├── vote/       # Servicio de votación (Python + Flask)
├── result/     # Servicio de visualización de resultados (Node.js)
├── worker/     # Servicio de procesamiento de votos (Node.js)
├── load-testing/ # (Opcional) Pruebas de carga
```

---

## ⚙️ Servicios y Tecnologías

| Servicio | Tecnología | Descripción |
|----------|------------|-------------|
| `vote`   | Python 3.11 + Flask | Recibe los votos desde el frontend |
| `result` | Node.js 20          | Muestra los resultados de la votación |
| `worker` | Node.js 20          | Procesa los votos desde Redis hacia PostgreSQL |
| `redis`  | Redis (alpine)      | Almacén temporal de votos |
| `database` | PostgreSQL 15 (alpine) | Base de datos relacional donde se guardan los votos procesados |

---

## 📦 Dockerización

Cada servicio tiene su propio `Dockerfile`:

### Ejemplo: `vote/Dockerfile`

```Dockerfile
FROM python:3.11-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 80

CMD ["python", "app.py"]
```

### Ejemplo: `result` y `worker` Dockerfile (Node.js)

```Dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000  # (solo en `result`)

CMD ["node", "main.js"]
```

---

## 🧪 Docker Compose

Archivo `docker-compose.yml` que orquesta todos los servicios:

- Se configuraron `volumes`, `depends_on`, y `healthchecks`.
- Se utilizaron variables de entorno definidas en un archivo `.env`.

### Variables del archivo `.env` (ejemplo)

```
REDIS_HOST=redis
DATABASE_HOST=database
DATABASE_USER=postgres
DATABASE_PASSWORD=postgres
DATABASE_NAME=votingdb
```

---

## ✅ Extra Challenge Implementado

- [x] Uso de `.env` para variables de entorno.
- [x] Configuración de `depends_on` entre servicios.
- [x] Pruebas deteniendo servicios como `worker` para ver impacto.
- [x] Agregado de `healthcheck` a servicios clave como `vote` y `result`.

---

## 🚀 Ejecución del Proyecto

```bash
docker compose up --build -d
```

---

## 🌐 Acceso a la App

- Página de Votación: [http://localhost:80](http://localhost:80)
- Página de Resultados: [http://localhost:3000](http://localhost:3000)

---

## 📚 Aprendizajes

- Uso avanzado de Docker y Docker Compose.
- Creación de múltiples contenedores con comunicación entre servicios.
- Implementación de variables de entorno con `.env`.
- Uso de `healthcheck` y dependencias entre servicios.
- Comprensión de sistemas distribuidos orientados a eventos (pub/sub con Redis).

---

**Desarrollado por Julio González – Reto 90 Días DevOps – Semana 2**
