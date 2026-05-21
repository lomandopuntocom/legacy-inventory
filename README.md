# Legacy Inventory - Arquitectura CI/CD en AWS

## Descripción de la Arquitectura
Este proyecto moderniza una aplicación monolítica "Legacy" mediante la implementación de prácticas DevOps. La arquitectura consta de:

* **Integración Continua (CI):** Pipeline configurado en GitHub Actions (`ci.yml`) que se dispara en la rama `develop`. Utiliza un entorno Ubuntu para configurar Node.js 20, instalar dependencias y ejecutar pruebas automatizadas, empaquetando un artefacto si son exitosas.
* **Infraestructura como Código (IaC):** Arquitectura modular utilizando Terraform.
  * **Módulo Network:** Gestiona los Security Groups, limitando el acceso estrictamente a la IP del administrador (`/32`) por requerimientos de seguridad.
  * **Módulo Compute:** Aprovisiona una instancia EC2 `t3.micro` con Amazon Linux 2023. Utiliza un script `user_data` (con `yum`) para automatizar la instalación de Node.js, git, clonar el repositorio y levantar el servicio.
  * El estado de Terraform se gestiona de forma remota y segura mediante un backend en Amazon S3.
* **Despliegue Continuo (CD):** Pipeline (`cd.yml`) ejecutado tras un merge a la rama `main`. Configura credenciales temporales de AWS y ejecuta `terraform init`, `plan` y `apply` de forma automatizada para aprovisionar los cambios sin intervención manual (GitOps).

## Enlace de Validación Funcional
La aplicación se encuentra desplegada y respondiendo en el puerto 5000:
**http://3.237.71.19:5000**