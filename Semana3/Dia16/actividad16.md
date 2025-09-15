# 🧪 Actividad Día 16 - CI con mi-calculadora (Flask + GitHub Actions)

Esta actividad forma parte del **Día 16 del reto #90DíasDeDevOps**. Se desarrolló una API simple con Flask llamada `mi-calculadora`, y se automatizó el testeo usando GitHub Actions.

---

## ✅ Objetivo

Automatizar la ejecución de tests cada vez que se suben cambios al repositorio.

---

## 📌 Lo que se hizo

- Se creó la app `mi-calculadora` con endpoints para sumar, restar, dividir y verificar números primos.
- Se escribieron 7 tests para validar la funcionalidad de los endpoints y funciones auxiliares.
- Se configuró un workflow (`ci-python.yml`) con GitHub Actions para:
  - Instalar dependencias.
  - Ejecutar los tests.
  - Medir cobertura de código.
  - Subir reporte como artefacto.

---

## 🔍 Resultado

El workflow se ejecutó correctamente al hacer push a `main`, y validó que la app y sus tests funcionan sin errores.

