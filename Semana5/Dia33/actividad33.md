# Actividad 33 - Kubernetes Storage y Aplicaciones Persistentes

## 🔹 Paso 1: StorageClass (Aprovisionamiento Dinámico)

Archivo: `storageclass.yaml`

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-storage
provisioner: kubernetes.io/no-provisioner   # Para local
volumeBindingMode: WaitForFirstConsumer
allowVolumeExpansion: true
```

Este recurso permite que los PVCs puedan crear PVs automáticamente.

---

## 🔹 Paso 2: PersistentVolumeClaim Dinámico

Archivo: `dynamic-pvc.yaml`

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: dynamic-pvc
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: fast-storage
```

Verificar:
```bash
kubectl get pvc
kubectl get pv
```

---

## 🔹 Paso 3: Aplicación Web + MySQL con almacenamiento

Archivo: `complete-app-with-storage.yaml`

```yaml
# MySQL con almacenamiento persistente
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc-app
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: fast-storage
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql-app
  template:
    metadata:
      labels:
        app: mysql-app
    spec:
      containers:
      - name: mysql
        image: mysql:8.0
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "rootpass123"
        - name: MYSQL_DATABASE
          value: "webapp"
        volumeMounts:
        - name: mysql-data
          mountPath: /var/lib/mysql
      volumes:
      - name: mysql-data
        persistentVolumeClaim:
          claimName: mysql-pvc-app
---
apiVersion: v1
kind: Service
metadata:
  name: mysql-app-service
spec:
  selector:
    app: mysql-app
  ports:
  - port: 3306
---
# Aplicación Web que se conecta a MySQL
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-with-db
spec:
  replicas: 2
  selector:
    matchLabels:
      app: webapp-with-db
  template:
    metadata:
      labels:
        app: webapp-with-db
    spec:
      containers:
      - name: webapp
        image: httpd:2.4
        env:
        - name: DB_HOST
          value: "mysql-app-service"
        - name: DB_NAME
          value: "webapp"
        volumeMounts:
        - name: web-content
          mountPath: /usr/local/apache2/htdocs
      volumes:
      - name: web-content
        emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
spec:
  selector:
    app: webapp-with-db
  ports:
  - port: 80
    nodePort: 30300
  type: NodePort
```

Aplicar todos los recursos:
```bash
kubectl apply -f storageclass.yaml
kubectl apply -f dynamic-pvc.yaml
kubectl apply -f complete-app-with-storage.yaml
```

Verificar que los pods estén corriendo:
```bash
kubectl get pods
kubectl get svc
```

Abrir la aplicación:
```
http://$(minikube ip):30300
```

---

## 🔹 Paso 4: StatefulSet con ReadWriteMany (Opcional)

Archivo: `statefulset-rwx.yaml`

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: shared-pvc
spec:
  accessModes:
  - ReadWriteMany
  resources:
    requests:
      storage: 2Gi
  storageClassName: nfs-storage
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: web-stateful
spec:
  serviceName: "web"
  replicas: 3
  selector:
    matchLabels:
      app: web-stateful
  template:
    metadata:
      labels:
        app: web-stateful
    spec:
      containers:
      - name: web
        image: nginx:alpine
        volumeMounts:
        - name: shared-data
          mountPath: /usr/share/nginx/html
      volumes:
      - name: shared-data
        persistentVolumeClaim:
          claimName: shared-pvc
```

⚠️ Este ejemplo requiere un backend compatible con **RWX** (NFS, GlusterFS, Ceph).

---

## 📸 Espacio para capturas de pantalla
Agregar imágenes de:
- Pods corriendo (`kubectl get pods`)
- Servicios (`kubectl get svc`)
- Aplicación web funcionando

```
![Captura 1](ruta/a/imagen1.png)
![Captura 2](ruta/a/imagen2.png)
```

---

**Fin de la Actividad 33**

