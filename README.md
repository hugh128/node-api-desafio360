# API REST Desafio Web 360

Esta es una API RESTful diseñada usando Nodejs y una base de Microsoft SQL Server para gestionar roles, estados, usuarios, clientes, productos, categorias y ordenes de ventas. La API permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre los recursos de la aplicación y proporciona autenticación mediante JWT (JSON Web Token) para garantizar que solo los usuarios autorizados puedan acceder a ciertas rutas.

## Funcionalidades

La API soporta las siguientes funcionalidades:

- **Autenticación**:
  - Registro de nuevos usuarios.
  - Inicio de sesión con validación de contraseñas encriptadas.
  - Generación de tokens JWT para autenticación.
  
- **Usuarios**:
  - Crear, actualizar, obtener y eliminar usuarios.
  - Validación de roles de usuario (Administrador, Operador, Cliente).

- **Productos**:
  - Crear, actualizar, obtener y eliminar productos.
  - Visualización de lista de productos.

- **Ordenes**:
  - Crear, obtener y actualizar órdenes.
  - Ver detalles de ordenes.

- **Autorización**:
  - Acceso protegido a rutas con roles especificos (Administrador, Operador).

## Requisitos

Para ejecutar este proyecto, asegúrate de tener instaladas las siguientes depedencias:
  -bcryptjs": "^2.4.3"
  -express": "^4.21.2"
  -dotenv": "^16.4.7"
  -jsonwebtoken": "^9.0.2"
  -mssql": "^11.0.1"

## Variables de entorno

```
DB_USER = nombreUsuario
DB_PASSWORD = password
DB_SEVER = localhost
DB_DATABASE = "GDA00593_OT_HUGO_ORDONEZ"
```
  
## Autor

- Hugo Aroldo Ordoñez Tuch
