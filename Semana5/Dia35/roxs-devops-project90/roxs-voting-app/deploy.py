import os
import sys
import subprocess

# Carpeta donde están tus manifiestos
k8s_dir = "k8s"

def apply_manifests():
    for file in os.listdir(k8s_dir):
        if file.endswith(".yaml"):
            path = os.path.join(k8s_dir, file)
            print(f"📦 Aplicando {path} ...")
            
            result = subprocess.run(["kubectl", "apply", "-f", path], capture_output=True, text=True)
            
            if result.returncode == 0:
                print(f"✅ {file} aplicado correctamente")
                print(result.stdout)
            else:
                print(f"❌ Error aplicando {file}")
                print(result.stderr)

def delete_manifests():
    for file in os.listdir(k8s_dir):
        if file.endswith(".yaml"):
            path = os.path.join(k8s_dir, file)
            print(f"🗑️ Borrando {path} ...")
            
            result = subprocess.run(["kubectl", "delete", "-f", path, "--ignore-not-found"], capture_output=True, text=True)
            
            if result.returncode == 0:
                print(f"✅ {file} borrado correctamente")
                print(result.stdout)
            else:
                print(f"❌ Error borrando {file}")
                print(result.stderr)

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "delete":
        delete_manifests()
    else:
        apply_manifests()
