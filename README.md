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

- bcryptjs
- express
- dotenv
- jsonwebtoken
- mssql

## Variables de entorno

```
DB_USER = nombreUsuario
DB_PASSWORD = password
DB_SEVER = localhost
DB_DATABASE = "GDA00593_OT_HUGO_ORDONEZ"
```

## Endpoints validados usando POSTMAN
  
Registro de pruebas realizados se encuentran en la carpeta "requests"

## Autor

- Hugo Aroldo Ordoñez Tuch
- Clave: GDA00593-OT
