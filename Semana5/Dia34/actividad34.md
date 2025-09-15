# 📌 Actividad 34 - Namespaces en Kubernetes

## 🎯 Objetivo
Organizar el clúster Kubernetes utilizando **namespaces** para separar entornos y aplicaciones.

---

## ✅ Pasos realizados

### 1. Creación de Namespaces
Se definieron los siguientes namespaces:
- `tienda-dev`
- `tienda-prod`
- `julio-dev` (namespace personal para pruebas)

Comando de verificación:
```bash
kubectl get namespaces
```

---

### 2. Despliegues en cada namespace

#### 🛠️ Desarrollo (`tienda-dev`)
- **Frontend** con 1 réplica.
- **Database** con 1 réplica.

#### 🚀 Producción (`tienda-prod`)
- **Frontend** con 3 réplicas.
- **Database** con 1 réplica.

Comando de verificación:
```bash
kubectl get all -n tienda-dev
kubectl get all -n tienda-prod
```

---

### 3. Gestión de contextos
Cambio de contexto para trabajar en un namespace específico:
```bash
kubectl config set-context --current --namespace=tienda-dev
```

Visualización global:
```bash
kubectl get all -A
```

---

### 4. Experimento Personal (`julio-dev`)
- Despliegue de un **Nginx** en el namespace personal.  
- Personalización del HTML inicial mediante un `ConfigMap` montado como volumen.

---

## 📂 Archivos creados
- `tienda-namespaces.yaml`
- `tienda-desarrollo.yaml`
- `tienda-produccion.yaml`

---

## 📸 Evidencias recomendadas
- Capturas de `kubectl get all -n tienda-dev`
- Capturas de `kubectl get all -n tienda-prod`
- Prueba de acceso al frontend en cada entorno
- Página personalizada en `julio-dev` con Nginx

---

## 🏁 Conclusión
Con esta actividad se logró:
- Separar entornos **Desarrollo** y **Producción** con namespaces.  
- Desplegar servicios independientes en cada entorno.  
- Probar buenas prácticas de organización y escalabilidad en Kubernetes.  
- Realizar un experimento personal con un namespace propio y contenido custom.  

✅ **Actividad 34 completada. Listo para continuar con el Día 35.**
