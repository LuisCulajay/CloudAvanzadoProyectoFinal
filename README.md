# Proyecto Final - AKS con Terraform

## Descripcion
Aprovisionamiento de un cluster Azure Kubernetes Service (AKS) usando Terraform,
con despliegue de una aplicacion nginx expuesta mediante un Service tipo LoadBalancer.

## Arquitectura
- Resource Group: rg-aks-terraform
- AKS Cluster: aks-demo-cluster (2 nodos, Standard_D2s_v7)
- Service Principal con rol Contributor scoped al Resource Group (principio de minimo privilegio)
- Autenticacion SSH configurada en los nodos para depuracion

## Requisitos previos
- Azure CLI
- Terraform >= 1.5
- kubectl
- Una suscripcion de Azure con credito disponible

## Pasos de despliegue

1. Autenticarse en Azure:
    ```bash
    az login
    ```

2. Configurar variables de entorno con las credenciales del Service Principal:
    ```bash
    $env:ARM_CLIENT_ID = "..."
    $env:ARM_CLIENT_SECRET = "..."
    $env:ARM_TENANT_ID = "..."
    $env:ARM_SUBSCRIPTION_ID = "..."
    ```
3. Crear terraform.tfvars con la llave publica SSH (ver terraform.tfvars.example)

4. Inicializar y aplicar Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

5. Exportar kubeconfig:
    ```bash
    az aks get-credentials --resource-group rg-aks-terraform --name aks-demo-cluster --overwrite-existing
    ```

6. Desplegar la aplicacion:
    ```bash
   kubectl apply -f nginx-deployment.yaml
    ```

7. Obtener la IP externa:
    ```bash
   kubectl get service nginx-service
    ```

## Eliminación de infraestructura
```bash
terraform destroy
```