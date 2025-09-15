# 🌍 Actividad Día 22 - Desafíos de Terraform

Este documento resume los tres ejercicios realizados como parte del **Día 22 del reto 90 Días DevOps**, enfocados en el uso de Terraform para definir infraestructura como código (IaC).

---

## ✅ Desafío 1: Calculadora de Costos

**Objetivo:**  
Crear un recurso local que genere un archivo `.json` con el costo total estimado de instancias EC2.

**Aspectos clave:**
- Uso de variables (`instance_type`, `instance_count`).
- Cálculo condicional del costo según el tipo de instancia.
- Generación de archivo con `local_file`.

**Archivo generado:**  
`cost-report.json`

---

## ✅ Desafío 2: Multi-Ambiente con Plantillas

**Objetivo:**  
Crear configuraciones personalizadas para diferentes entornos (`dev`, `staging`, `prod`) usando templates.

**Aspectos clave:**
- Uso de la función `templatefile`.
- Separación de configuraciones por entorno en la carpeta `environments/`.
- Variables que definen el entorno y su configuración.

**Archivos generados:**  
- `dev.tf`, `staging.tf`, `prod.tf` (en `solutions/challenge-2-multi-env/environments/`)

---

## ✅ Desafío 3: Infraestructura Dinámica

**Objetivo:**  
Crear infraestructura que se adapte automáticamente al tipo de carga (`workload_type`): `web`, `api`, `database`, `cache`, `queue`.

**Aspectos clave:**
- Validación de valores con `validation`.
- Uso de `locals` para mapear configuraciones dinámicas.
- Cálculo de costos estimados.
- Creación de archivo `infrastructure-plan-<tipo>.json` con la configuración seleccionada.

**Archivo generado:**  
`infrastructure-plan-web.json` (u otro según el tipo elegido)

---

📂 Todos los ejercicios se encuentran organizados en la carpeta `terraform-challenges/solutions`.

