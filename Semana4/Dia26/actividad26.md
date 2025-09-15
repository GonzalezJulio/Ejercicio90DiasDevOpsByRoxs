# 📅 Día 26 - Estado Remoto y Workspaces en Terraform

## 🎯 Objetivo
Aprender a trabajar con múltiples entornos (`dev`, `staging`, `prod`) usando **workspaces** en Terraform y comprender el uso del archivo `terraform.tfstate`.

---

## 🧠 Conceptos Clave

### ✅ ¿Qué es el `terraform.tfstate`?
- Archivo local (o remoto) que **guarda el estado real** de los recursos que Terraform gestiona.
- Si se borra sin hacer `terraform destroy`, los recursos en la nube siguen existiendo, pero Terraform **pierde el control sobre ellos**, lo que puede causar conflictos.

### ✅ ¿Qué son los `workspaces`?
- Permiten usar **el mismo código** para desplegar en distintos entornos (como `dev`, `staging`, `prod`).
- Cada workspace mantiene su propio `terraform.tfstate` separado.
- Comando para crear y usar:
  ```bash
  terraform workspace new staging
  terraform workspace select staging
  ```

### ✅ Ventajas
- ✅ Reutilización del código.
- ✅ Aislamiento de estados por entorno.
- ✅ Evita la duplicación de carpetas o archivos `.tf`.

---

## ⚙️ Práctica Realizada

### Estructura principal:

\`\`\`hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_network" "network" {
  name = "mi-app-${terraform.workspace}-network"
}
\`\`\`

- Creamos una red distinta por cada entorno.
- Usamos `terraform.workspace` para que el nombre cambie dinámicamente.

### 🌐 Simulación de múltiples entornos

1. Creamos 3 workspaces:
   \`\`\`bash
   terraform workspace new dev
   terraform apply
   terraform workspace new staging
   terraform apply
   terraform workspace new prod
   terraform apply
   \`\`\`

2. Resultado:
   - Se crean redes: `mi-app-dev-network`, `mi-app-staging-network`, `mi-app-prod-network`
   - Cada una vive en su propio estado, sin pisarse.

---

## 📌 Conclusión

- Los `workspaces` son ideales para separar entornos sin duplicar código.
- El archivo `terraform.tfstate` es fundamental para que Terraform mantenga sincronía con el entorno real.
- Borrar el `tfstate` sin destruir puede dejar recursos **huérfanos** y causar errores.

---