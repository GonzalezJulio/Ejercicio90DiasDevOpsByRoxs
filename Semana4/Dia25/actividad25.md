### 📘 — Día 25 del Reto 90 Días DevOps  
**Tema:** Uso de Módulos con el Provider Docker en Terraform  

---

#### ✅ Objetivo del día

Crear un **módulo reutilizable en Terraform** para desplegar contenedores Docker parametrizados, incluyendo:

- Imagen personalizada  
- Contenedor con puertos expuestos  
- Red Docker dedicada  
- Volumen persistente montado  

---

#### 🧱 Estructura creada

.
├── main.tf # Archivo raíz que instancia el módulo
├── module/
│ └── docker-webapp/
│ ├── main.tf # Lógica del recurso docker
│ ├── variables.tf # Variables de entrada
│ ├── outputs.tf # Outputs del módulo
│ └── README.md # (opcional)
└── actividad25.md # Este archivo

yaml
Copiar
Editar

---

#### ⚙️ Recursos Docker gestionados

Dentro del módulo `docker-webapp` se definen:

- `docker_network`: red bridge dedicada para el contenedor  
- `docker_volume`: volumen persistente  
- `docker_image`: descarga la imagen definida  
- `docker_container`: crea el contenedor con la configuración dinámica  

---

#### 📦 Variables parametrizadas

El módulo acepta variables para:

- `image_name`: nombre de imagen Docker (ej: `"nginx:latest"`)  
- `container_name`: nombre del contenedor  
- `host_port` y `container_port`: mapeo de puertos  
- `docker_network`: nombre de la red  
- `volume_name`: nombre del volumen Docker  
- `mount_path`: ruta donde se monta el volumen dentro del contenedor  

---

#### 🧪 Resultado

Se aplicó correctamente con:

```hcl
module "webapp" {
  source          = "./module/docker-webapp"
  image_name      = "nginx:latest"
  container_name  = "nginx-test"
  host_port       = 8080
  container_port  = 80
  docker_network  = "webapp_net"
  volume_name     = "webapp_data"
  mount_path      = "/usr/share/nginx/html"
}
Esto desplegó un contenedor NGINX funcional, montado en red propia y con volumen persistente.

