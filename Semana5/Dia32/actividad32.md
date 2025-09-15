# 📌 Día 32 - Kubernetes ConfigMaps y Secrets

En este día del reto **90 Días DevOps**, trabajé con **ConfigMaps** y **Secrets** en Kubernetes para gestionar configuraciones sensibles y no sensibles de manera adecuada.

---

## 🔑 Objetivos
- Aprender la diferencia entre **ConfigMaps** y **Secrets**.
- Crear un `Secret` para credenciales de MongoDB.
- Montar variables de entorno en un Deployment desde un `Secret`.
- Desplegar MongoDB en Kubernetes usando credenciales seguras.

---

## 📝 Recursos creados

### 1. Secret: `mongodb-credentials`
Este `Secret` almacena las credenciales necesarias para inicializar MongoDB.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mongodb-credentials
type: Opaque
stringData:
  MONGO_INITDB_ROOT_USERNAME: admin
  MONGO_INITDB_ROOT_PASSWORD: master123
  MONGO_INITDB_DATABASE: myapp
```

---

### 2. Deployment: `mongodb`
Se configuró un `Deployment` que crea 3 réplicas de MongoDB, tomando las credenciales del `Secret`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb-deploy
spec:
  replicas: 3
  selector:
    matchLabels:
      app: mongodb-deploy
  template:
    metadata:
      labels:
        app: mongodb-deploy
    spec:
      containers:
      - name: mongodb
        image: mongo:latest
        ports:
        - containerPort: 27017
        envFrom:
        - secretRef:
            name: mongodb-credentials
```

---

## 🚀 Comandos utilizados

- Crear los recursos en el cluster:
```bash
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
```

- Verificar que los pods se despliegan correctamente:
```bash
kubectl get pods -l app=mongodb-deploy -w
```

- Revisar logs de un pod específico:
```bash
kubectl logs <nombre-del-pod>
```

---

## 📌 Conclusiones
- **ConfigMaps** son ideales para configuraciones no sensibles (ejemplo: variables de entorno comunes).  
- **Secrets** permiten manejar contraseñas y datos sensibles de forma más segura.  
- Aprendí a inyectar credenciales en contenedores usando `envFrom` y `secretRef`.  

---

## 📸 Evidencias
👉 Aquí se pueden agregar capturas de pantalla del despliegue y pruebas realizadas.

