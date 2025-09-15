— Día 23 del Reto 90 Días DevOps
Tema: Variables dinámicas y templates en Terraform

✅ Objetivo del día
Practicar el uso de:

locals

Variables complejas (map, object, for)

templatefile()

Generación de archivos .yaml dinámicos con contenido interpolado

📁 Archivos clave
locals.tf: define configuración global y por servicio

main.tf: genera archivos usando templatefile()

templates/: carpeta con archivos .tmpl para renderizar

🧪 Resultado
Generación de múltiples archivos de configuración, por ejemplo:

text
Copiar
Editar
vote-config.yaml
result-config.yaml
worker-config.yaml
Cada uno con contenido dinámico interpolado desde las variables de Terraform.

