# actividad20

## Día 20 - Monitoreo y Logs para tu App

Este día se enfocó en agregar monitoreo básico a la aplicación desarrollada en el Día 19, incorporando herramientas para verificar el estado de la app, registrar logs y automatizar revisiones periódicas desde GitHub Actions.

---

### ✅ Objetivos cumplidos:

- Se implementó un endpoint `/health` en Flask para verificar que la aplicación esté funcionando correctamente.
- Se agregó un logger básico para registrar cada request entrante en consola y en un archivo (`app.log`).
- Se configuró Docker para gestionar los logs con límites de tamaño.
- Se creó un script `check-app.sh` que permite verificar desde la terminal si la app responde correctamente en los endpoints `/`, `/ping` y `/health`.
- Se creó un workflow en GitHub Actions (`monitoreo.yml`) que corre automáticamente cada 2 horas (o manualmente), y realiza un chequeo remoto al endpoint `/health`.

---

### 📁 Archivos añadidos:

- `scripts/check-app.sh`: Script de verificación de estado local.
- `.github/workflows/monitoreo.yml`: Workflow para monitoreo remoto.
- Modificaciones en `app.py` o `main.py` para agregar `/health` y logging.

---

### 🧪 Cómo probar:

1. Levantar la app con Docker Compose:
   ```bash
   docker compose up -d --build
   ```

2. Ejecutar monitoreo local:
   ```bash
   ./scripts/check-app.sh
   ```

3. Ver logs:
   ```bash
   docker compose logs -f app
   ```

4. Verificar ejecución del workflow en GitHub (`Actions > Monitoreo Simple`)

---

### 🚀 Conclusión

Monitorear una aplicación es esencial para detectar problemas a tiempo y mantener la confiabilidad. Esta actividad sienta las bases para sistemas más avanzados de alertas, métricas y observabilidad en entornos de producción.
