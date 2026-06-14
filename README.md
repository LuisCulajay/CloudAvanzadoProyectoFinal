# Proyecto Final - AKS con Terraform

## Descripcion
Aprovisionamiento de un cluster Azure Kubernetes Service (AKS) usando Terraform,
con despliegue de una aplicacion nginx expuesta mediante un Service tipo LoadBalancer.

## Arquitectura
- Resource Group: rg-aks-terraform (preexistente)
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
   az login

2. Configurar variables de entorno con las credenciales del Service Principal:
   $env:ARM_CLIENT_ID = "..."
   $env:ARM_CLIENT_SECRET = "..."
   $env:ARM_TENANT_ID = "..."
   $env:ARM_SUBSCRIPTION_ID = "..."

3. Crear terraform.tfvars con tu llave publica SSH (ver terraform.tfvars.example)

4. Inicializar y aplicar Terraform:
   terraform init
   terraform plan
   terraform apply

5. Exportar kubeconfig:
   az aks get-credentials --resource-group rg-aks-terraform --name aks-demo-cluster --overwrite-existing

6. Desplegar la aplicacion:
   kubectl apply -f nginx-deployment.yaml

7. Obtener la IP externa:
   kubectl get service nginx-service

## Limpieza
   terraform destroy