# 🚀 Actividad Día 31 - Kubernetes Services y Networking

En esta actividad trabajamos con **Services en Kubernetes**, entendiendo su importancia para la comunicación entre Pods y la exposición de aplicaciones.

---

## 📌 Conceptos clave aprendidos

1. **Problema que resuelven los Services**
   - Los Pods en Kubernetes tienen IPs efímeras que cambian si el Pod se reinicia.
   - Los Services crean un endpoint estable para acceder a los Pods.
   - Además, permiten balanceo de carga interno entre Pods de un mismo Deployment.

2. **Tipos principales de Services**
   - **ClusterIP** → Expone el servicio dentro del clúster (interno).
   - **NodePort** → Expone el servicio fuera del clúster, usando el puerto de los nodos.

3. **Flujo de trabajo aplicado**
   - Creamos un **Deployment para el backend**.
   - Generamos un **Service tipo ClusterIP** llamado `backend-service`.
   - Probamos la comunicación interna desde otro Pod.
   - Luego, creamos un **Service tipo NodePort** (`backend-nodeport`) para exponerlo externamente.
   - Accedimos desde el host a través de la IP de Minikube y el NodePort.

---

## 📂 Comandos utilizados

### Ver servicios disponibles
```bash
kubectl get svc
```

### Crear Service tipo NodePort
```bash
kubectl expose deployment backend-deployment   --name=backend-nodeport   --type=NodePort   --port=80   --target-port=80
```

### Ver IP de Minikube
```bash
minikube ip
```

### Probar acceso desde el host
```bash
curl http://<minikube-ip>:<nodeport>
```

Ejemplo real:
```bash
curl http://192.168.49.2:32026
<html><body><h1>It works!</h1></body></html>
```

---

## ✅ Resultados obtenidos
- Pudimos verificar que el **Service ClusterIP** permite comunicación interna.
- El **Service NodePort** nos permitió acceder a la aplicación desde fuera del clúster.
- Confirmamos la salida correcta con el mensaje `It works!`.

---

## 🖼️ Capturas del trabajo
👉 Aquí se agregarán las imágenes de las pruebas realizadas en Minikube y Kubernetes.

- Imagen 1: Verificación del Deployment.
- Imagen 2: Creación del Service ClusterIP.
- Imagen 3: Comunicación interna entre Pods.
- Imagen 4: Creación del NodePort.
- Imagen 5: Acceso desde el host con `curl`.
- Imagen 6: Respuesta `It works!`.
- Imagen 7: Vista general de servicios y pods.

---

📌 **Nombre del archivo:** `actividad31.md`
