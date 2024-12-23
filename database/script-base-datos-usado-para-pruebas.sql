USE [master]
GO
/****** Object:  Database [GDA00593_OT_HUGO_ORDONEZ]    Script Date: 22/12/2024 05:25:04 p. m. ******/
CREATE DATABASE [GDA00593_OT_HUGO_ORDONEZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GDA00593_OT_HUGO_ORDONEZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00593_OT_HUGO_ORDONEZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GDA00593_OT_HUGO_ORDONEZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00593_OT_HUGO_ORDONEZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GDA00593_OT_HUGO_ORDONEZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET RECOVERY FULL 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET  MULTI_USER 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GDA00593_OT_HUGO_ORDONEZ', N'ON'
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET QUERY_STORE = ON
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GDA00593_OT_HUGO_ORDONEZ]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstados] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProductos] [int] IDENTITY(1,1) NOT NULL,
	[categoriaProductos_idCategoriaProductos] [int] NOT NULL,
	[usuarios_idUsuarios] [int] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[marca] [varchar](45) NOT NULL,
	[codigo] [varchar](45) NOT NULL,
	[stock] [float] NOT NULL,
	[estados_idEstados] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[foto] [binary](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_totalProductosActivos]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Vistas
--a. Total de Productos activos que tenga en stock mayor a 0
create   view [dbo].[v_totalProductosActivos] as
select 
    sum(p.stock * p.precio) as total_inventario
from Productos p
inner join Estados e on p.estados_idEstados = e.idEstados
where e.nombre = 'Activo' and p.stock > 0;
GO
/****** Object:  View [dbo].[v_productosActivosStock]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   view [dbo].[v_productosActivosStock] as
select 
    p.idProductos,
    p.nombre,
    p.marca,
    p.codigo,
    p.stock,
    e.nombre as estado
from Productos p
inner join Estados e on p.estados_idEstados = e.idEstados
where e.nombre = 'Activo' and p.stock > 0;
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[idOrden] [int] IDENTITY(1,1) NOT NULL,
	[usuarios_idUsuarios] [int] NOT NULL,
	[estados_idEstados] [int] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[nombreCompleto] [varchar](245) NOT NULL,
	[direccion] [varchar](545) NOT NULL,
	[telefono] [varchar](45) NOT NULL,
	[correoElectronico] [varchar](100) NOT NULL,
	[fechaEntrega] [date] NOT NULL,
	[totalOrden] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_totalOrdenesAgosto2024]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--b. Total de Quetzales en ordenes ingresadas en el mes de Agosto 2024
create   view [dbo].[v_totalOrdenesAgosto2024] as
select 
    sum(o.totalOrden) as total_quetzales
from Orden o
where o.fechaCreacion >= '2024-08-01' and o.fechaCreacion < '2024-09-01';
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idClientes] [int] IDENTITY(1,1) NOT NULL,
	[razonSocial] [varchar](245) NULL,
	[nombreComercial] [varchar](545) NOT NULL,
	[direccion] [varchar](545) NOT NULL,
	[telefono] [varchar](45) NOT NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuarios] [int] IDENTITY(1,1) NOT NULL,
	[rol_idRol] [int] NOT NULL,
	[estados_idEstados] [int] NOT NULL,
	[correoElectronico] [varchar](100) NOT NULL,
	[nombreCompleto] [varchar](245) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[telefono] [varchar](45) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[clientes_idClientes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_Top10ClientesConsumo]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--c. Top 10 de clientes con Mayor consumo de ordenes de todo el histórico
create   view [dbo].[v_Top10ClientesConsumo] as
select top(10)
    u.idUsuarios,
	c.idClientes,
    c.razonSocial,
    c.nombreComercial,
    sum(o.totalOrden) as totalConsumo
from Orden o
inner join Usuarios u on o.usuarios_idUsuarios = u.idUsuarios
inner join Clientes c on u.clientes_idClientes = c.idClientes
group by u.idUsuarios, c.idClientes, c.razonSocial, c.nombreComercial
order by totalConsumo desc;
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenDetalles](
	[idOrdenDetalles] [int] IDENTITY(1,1) NOT NULL,
	[orden_idOrden] [int] NOT NULL,
	[productos_idProductos] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[subtotal] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrdenDetalles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_top10ProductosMasVendidos]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--d. Top 10 de productos más vendidos en orden ascendente
create   view [dbo].[v_top10ProductosMasVendidos] as
select top (10)
    p.idProductos,
    p.nombre,
    p.marca,
    sum(od.cantidad) as totalVendido
from OrdenDetalles od
inner join Productos p on od.productos_idProductos = p.idProductos
group by p.idProductos, p.nombre, p.marca
order by totalVendido asc;
GO
/****** Object:  Table [dbo].[CategoriaProductos]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaProductos](
	[idCategoriaProductos] [int] IDENTITY(1,1) NOT NULL,
	[usuarios_idUsuarios] [int] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[estados_idEstados] [int] NOT NULL,
	[fechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoriaProductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ('Sin razon social') FOR [razonSocial]
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD  CONSTRAINT [FK_categoriaPro_estados] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
GO
ALTER TABLE [dbo].[CategoriaProductos] CHECK CONSTRAINT [FK_categoriaPro_estados]
GO
ALTER TABLE [dbo].[CategoriaProductos]  WITH CHECK ADD  CONSTRAINT [FK_categoriaPro_usuarios] FOREIGN KEY([usuarios_idUsuarios])
REFERENCES [dbo].[Usuarios] ([idUsuarios])
GO
ALTER TABLE [dbo].[CategoriaProductos] CHECK CONSTRAINT [FK_categoriaPro_usuarios]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_orden_estados] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_orden_estados]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_orden_usuarios] FOREIGN KEY([usuarios_idUsuarios])
REFERENCES [dbo].[Usuarios] ([idUsuarios])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_orden_usuarios]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_ordenDet_orden] FOREIGN KEY([orden_idOrden])
REFERENCES [dbo].[Orden] ([idOrden])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_ordenDet_orden]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_ordenDet_productos] FOREIGN KEY([productos_idProductos])
REFERENCES [dbo].[Productos] ([idProductos])
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_ordenDet_productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_categoria] FOREIGN KEY([categoriaProductos_idCategoriaProductos])
REFERENCES [dbo].[CategoriaProductos] ([idCategoriaProductos])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_productos_categoria]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_estados] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_productos_estados]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_usuarios] FOREIGN KEY([usuarios_idUsuarios])
REFERENCES [dbo].[Usuarios] ([idUsuarios])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_productos_usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_clientes] FOREIGN KEY([clientes_idClientes])
REFERENCES [dbo].[Clientes] ([idClientes])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_usuarios_clientes]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_estados] FOREIGN KEY([estados_idEstados])
REFERENCES [dbo].[Estados] ([idEstados])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_usuarios_estados]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_rol] FOREIGN KEY([rol_idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_usuarios_rol]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_cliente_email] CHECK  (([email] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_cliente_email]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CK_usuarios_email] CHECK  (([correoElectronico] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CK_usuarios_email]
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarCategoriaProductos]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar categoria de productos
create   proc [dbo].[p_actualizarCategoriaProductos]
    @idCategoriaProductos int,
    @nuevoNombre varchar(45),
    @nuevoEstado varchar(45)
as
begin
    if not exists (select 1 from CategoriaProductos where idCategoriaProductos = @idCategoriaProductos)
    begin
        raiserror('La categoría especificada no existe', 16, 1);
        return;
    end

	declare @estados_idEstados int;
	select @estados_idEstados = idEstados from Estados where nombre = @nuevoEstado;
	if @estados_idEstados is null
	begin
		raiserror('El estado especificado no existe', 16, 1);
        return;
	end

    update CategoriaProductos
    set nombre = @nuevoNombre,
        estados_idEstados = @estados_idEstados
    where idCategoriaProductos = @idCategoriaProductos;

    print('Categoría actualizada correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarCliente]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar clientes
create   proc [dbo].[p_actualizarCliente]
    @idClientes int,
    @razonSocial varchar(245) = NULL,
    @nombreComercial varchar(545),
	@direccion varchar(545),
    @telefono varchar(45),
    @email varchar(100)
as
begin
    if @razonSocial is null
    begin
        set @razonSocial = 'Sin razon social';
    end
	if exists (select 1 from Clientes where idClientes = @idCLientes)
	begin
		update Clientes
		set 
			razonSocial = @razonSocial,
			nombreComercial = @nombreComercial,
			direccion = @direccion,
			telefono = @telefono,
			email = @email
		where idClientes = @idClientes;
		print('Cliente actualizado correctamente');
	end
	else
	begin
		raiserror('No se encontro el cliente con el ID proporcionado', 16, 1);
    end
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarEstado]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar estado
create   proc [dbo].[p_actualizarEstado]
	@idEstado int,
	@nombre varchar(45)
as
begin
	if exists (select 1 from Estados where idEstados = @idEstado)
	begin
		update Estados
		set nombre = @nombre
		where idEstados = @idEstado;
		print('Estado actualizado correctamente');
	end
	else
	begin
		raiserror('El estado no existe', 16, 1);
	end
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarEstadoCategoriaProductos]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar estado de categoria de producto
create   proc [dbo].[p_actualizarEstadoCategoriaProductos]
    @idCategoriaProductos int,
    @nuevoEstado varchar(45)
as
begin
    if not exists (select 1 from CategoriaProductos where idCategoriaProductos = @idCategoriaProductos)
    begin
        raiserror('La categoría especificada no existe', 16, 1);
        return;
    end

	declare @estados_idEstados int;
	select @estados_idEstados = idEstados from Estados where nombre = @nuevoEstado;
	if @estados_idEstados is null
	begin
		raiserror('El estado especificado no existe', 16, 1);
        return;
	end

    update CategoriaProductos
    set estados_idEstados = @estados_idEstados
    where idCategoriaProductos = @idCategoriaProductos;

    print('Estado de la categoría actualizado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarEstadoProducto]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar estado del producto
create   proc [dbo].[p_actualizarEstadoProducto]
    @idProducto int,
    @nuevoEstado varchar(45)
as
begin
    if not exists (select 1 from Productos where idProductos = @idProducto)
    begin
        raiserror('El producto especificado no existe', 16, 1);
        return;
    end

	declare @estados_idEstados int;
	select @estados_idEstados = idEstados from Estados where nombre = @nuevoEstado;
	if @estados_idEstados is null
	begin
		raiserror('El estado especificado no existe', 16, 1);
        return;
	end

    update Productos
    set estados_idEstados = @estados_idEstados
    where idProductos = @idProducto;
    print('Estado del producto actualizado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarEstadoUsuario]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar estado de usuario
create   proc [dbo].[p_actualizarEstadoUsuario]
    @idUsuarios int,
    @nuevoEstado varchar(45)
as
begin
    if exists (select 1 from Usuarios where idUsuarios = @idUsuarios)	
    begin
		declare @idEstado int;
		
		select @idEstado = idEstados from Estados where nombre = @nuevoEstado;
		
		if @idEstado is null
		begin
			raiserror('El estado proporcionado no existe', 16, 1);
		end
	
        update Usuarios
        set estados_idEstados = @idEstado
        where idUsuarios = @idUsuarios;
        print('Estado del usuario actualizado correctamente');
    end
    else
    begin
        raiserror('El usuario con el ID proporcionado no existe', 16, 1);
    end
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarProducto]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar producto
create   proc [dbo].[p_actualizarProducto]
    @idProducto int,
    @categoriaProductos_idCategoriaProductos int,
    @usuarios_idUsuarios int,
    @nombre varchar(45),
    @marca varchar(45),
    @codigo varchar(45),
    @stock float,
	@estados_nombre varchar(45),
    @precio float,
    @foto binary
as
begin
    if not exists (select 1 from Usuarios where idUsuarios = @usuarios_idUsuarios)
    begin
        raiserror('El usuario especificado no existe', 16, 1);
        return;
    end

    if not exists (select 1 from Usuarios u
                   join Rol r on u.rol_idRol = r.idRol
                   where u.idUsuarios = @usuarios_idUsuarios and r.nombre in ('Administrador', 'Operador'))
    begin
        raiserror('El usuario no tiene permisos para actualizar productos', 16, 1);
        return;
    end

    if not exists (select 1 from Productos where idProductos = @idProducto)
    begin
        raiserror('El producto especificado no existe', 16, 1);
        return;
    end

    if not exists (select 1 from CategoriaProductos where idCategoriaProductos = @categoriaProductos_idCategoriaProductos)
    begin
        raiserror('La categoría especificada no existe', 16, 1);
        return;
    end
	
	declare @estados_idEstados int;
	select @estados_idEstados = idEstados from Estados where nombre = @estados_nombre;
	if @estados_idEstados is null
	begin
		raiserror('El estado especificado no existe', 16, 1);
        return;
	end

    update Productos
    set 
        categoriaProductos_idCategoriaProductos = @categoriaProductos_idCategoriaProductos,
        nombre = @nombre,
        marca = @marca,
        codigo = @codigo,
        stock = @stock,
		estados_idEstados = @estados_idEstados,
        precio = @precio,
        foto = @foto
    where idProductos = @idProducto;

    print('Producto actualizado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarRol]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar rol
create   proc [dbo].[p_actualizarRol]
	@idRol int,
	@nombre varchar(45)
as
begin
	if exists (select 1 from Rol where idRol = @idRol)
	begin
		update Rol
		set nombre = @nombre
		where idRol = @idRol;
		print('Rol actualizado correctamente');
	end
	else
	begin
		raiserror('El rol no existe', 16, 1);
	end
end;
GO
/****** Object:  StoredProcedure [dbo].[p_actualizarUsuario]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar Usuario
create   proc [dbo].[p_actualizarUsuario]
    @idUsuarios int,
    @rol_nombre varchar(45),
    @estados_nombre varchar(45),
    @correoElectronico varchar(100),
    @nombreCompleto varchar(245),
    @password varchar(255),
    @telefono varchar(45),
    @fechaNacimiento date,
    @clientes_idClientes int = NULL
as
begin
	declare @rol_idRol int;
	declare @estados_idEstados int;
	
    if exists (select 1 from Usuarios where idUsuarios = @idUsuarios)
    begin
		
		select @rol_idRol = idRol from Rol where nombre = @rol_nombre;
		if @rol_idRol is NULL
		begin
			raiserror('El rol proporcionado no existe', 16, 1);
			return;
		end;
		
		select @estados_idEstados = idEstados from Estados where nombre = @estados_nombre;
		if @estados_idEstados is NULL
		begin
			raiserror('El estado proporcionado no existe', 16, 1);
		end	
	
        update Usuarios
        set 
            rol_idRol = @rol_idRol,
            estados_idEstados = @estados_idEstados,
            correoElectronico = @correoElectronico,
            nombreCompleto = @nombreCompleto,
            password = @password,
            telefono = @telefono,
            fechaNacimiento = @fechaNacimiento,
            clientes_idClientes = @clientes_idClientes
        where idUsuarios = @idUsuarios;
        print('Usuario actualizado correctamente');
    end
    else
    begin
        raiserror('El usuario con el ID proporcionado no existe', 16, 1);
    end
end;
GO
/****** Object:  StoredProcedure [dbo].[p_cambiarEstadoOrden]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Actualizar estado de Orden
create   proc [dbo].[p_cambiarEstadoOrden]
    @idOrden int,
    @nuevoEstado varchar(45)
as
begin
    if not exists (select 1 from Orden where idOrden = @idOrden)
    begin
        raiserror('La orden especificada no existe', 16, 1);
        return;
    end

	declare @estados_idEstados int;
	select @estados_idEstados = idEstados from Estados where nombre = @nuevoEstado;
	if @estados_idEstados is null
	begin
		raiserror('El estado especificado no existe', 16, 1);
        return;
	end

    update Orden
    set estados_idEstados = @estados_idEstados
    where idOrden = @idOrden;
    print('Estado de la orden actualizado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_insertarCategoriaProductos]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Insertar categoria de productos
create   proc [dbo].[p_insertarCategoriaProductos]
    @usuarios_idUsuarios int,
    @nombre varchar(45),
    @estados_nombre varchar(45)
as
begin
    if not exists (select 1 from Usuarios where idUsuarios = @usuarios_idUsuarios)
    begin
        raiserror('El usuario especificado no existe', 16, 1);
        return;
    end

	declare @estados_idEstados int;
	select @estados_idEstados = idEstados from Estados where nombre = @estados_nombre;
	if @estados_idEstados is null
	begin
		raiserror('El estado especificado no existe', 16, 1);
        return;
	end

    insert into CategoriaProductos (usuarios_idUsuarios, nombre, estados_idEstados, fechaCreacion)
    values (@usuarios_idUsuarios, @nombre, @estados_idEstados, getdate());
	select SCOPE_IDENTITY() as ID;
    print('Categoría insertada correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_insertarClientes]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Insertar clientes
create   proc [dbo].[p_insertarClientes]
    @razonSocial varchar(245) = NULL,
    @nombreComercial varchar(545),
	@direccion varchar(545),
    @telefono varchar(45),
    @email varchar(100)
as
begin
    if @razonSocial is null
    begin
        set @razonSocial = 'Sin razon social';
    end
    insert into Clientes (razonSocial, nombreComercial, direccion, telefono, email)
    values (@razonSocial, @nombreComercial, @direccion, @telefono, @email);
	select SCOPE_IDENTITY() as ID;
    print('Cliente agregado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_insertarEstado]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimientos
--Insertar estado
create   proc [dbo].[p_insertarEstado]
	@nombre varchar(45)
as
begin
	insert into Estados (nombre)
	values (@nombre);
	select SCOPE_IDENTITY() as ID;
	print('Estado agregado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_insertarProducto]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Insertar productos
create   proc [dbo].[p_insertarProducto]
    @categoriaProductos_idCategoriaProductos int,
    @usuarios_idUsuarios int,
    @nombre varchar(45),
    @marca varchar(45),
    @codigo varchar(45),
    @stock float,
	@estados_nombre varchar(45),
    @precio float,
    @foto binary
as
begin
    if not exists (select 1 from Usuarios where idUsuarios = @usuarios_idUsuarios)
    begin
        raiserror('El usuario especificado no existe', 16, 1);
        return;
    end

    if not exists (select 1 from Usuarios u
                   join Rol r on u.rol_idRol = r.idRol
                   where u.idUsuarios = @usuarios_idUsuarios and r.nombre in ('Administrador', 'Operador'))
    begin
        raiserror('El usuario no tiene permisos para insertar productos', 16, 1);
        return;
    end

    if not exists (select 1 from CategoriaProductos where idCategoriaProductos = @categoriaProductos_idCategoriaProductos)
    begin
        raiserror('La categoría especificada no existe', 16, 1);
        return;
    end
	
	declare @estados_idEstados int;
	select @estados_idEstados = idEstados from Estados where nombre = @estados_nombre;
	if @estados_idEstados is null
	begin
		raiserror('El estado especificado no existe', 16, 1);
        return;
	end

    insert into Productos (categoriaProductos_idCategoriaProductos, usuarios_idUsuarios, nombre, marca, codigo, stock, estados_idEstados, precio, fechaCreacion, foto)
    values (@categoriaProductos_idCategoriaProductos, @usuarios_idUsuarios, @nombre, @marca, @codigo, @stock, @estados_idEstados, @precio, getdate(), @foto);
	select SCOPE_IDENTITY() as ID;
    print('Producto insertado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_insertarRol]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Insertar rol
create   proc [dbo].[p_insertarRol]
	@nombre varchar(45)
as
begin
	insert into Rol (nombre)
	values (@nombre);
	select SCOPE_IDENTITY() as ID;
	print('Rol agregado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_insertarUsuario]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Insertar usuario
create   proc [dbo].[p_insertarUsuario]
	@rol_nombre varchar(45),
    @estados_nombre varchar(45),
    @correoElectronico varchar(100),
    @nombreCompleto varchar(245),
    @password varchar(255),
    @telefono varchar(45),
    @fechaNacimiento date,
    @clientes_idClientes int = null
as
begin
	
	declare @rol_idRol int;
	declare @estados_idEstados int;
	
	select @rol_idRol = idRol from Rol where nombre = @rol_nombre;
	if @rol_nombre is null
	begin
		raiserror('El rol proporcionado no existe', 16, 1);
		return;
	end
	
	select @estados_idEstados = idEstados from Estados where nombre = @estados_nombre;
	if @estados_idEstados is null
	begin
		raiserror('El estado proporcionado no existe', 16, 1);
		return;
	end

	insert into Usuarios (
		rol_idRol, estados_idEstados, correoElectronico, nombreCompleto, password, telefono, fechaNacimiento, fechaCreacion, clientes_idClientes
    )
	values (
		@rol_idRol, @estados_idEstados, @correoElectronico, @nombreCompleto, @password, @telefono, @fechaNacimiento, getdate(), @clientes_idClientes
	);
	select SCOPE_IDENTITY() as ID;
    print('Usuario agregado correctamente');
end;
GO
/****** Object:  StoredProcedure [dbo].[p_obtenerUsuarioPorCorreo]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Buscar usuario por correo
CREATE   PROCEDURE [dbo].[p_obtenerUsuarioPorCorreo]
    @correoElectronico VARCHAR(100)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Usuarios WHERE correoElectronico = @correoElectronico)
    BEGIN
        SELECT * FROM Usuarios WHERE correoElectronico = @correoElectronico;
    END
    ELSE
    BEGIN
        RAISERROR('No se encontro un usuario con el correo proporcionado', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[s_editarOrden]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Agregar o eliminar productos a la orden
create   proc [dbo].[s_editarOrden]
    @idOrden INT,
    @detalles NVARCHAR(MAX)
as
begin
    begin transaction;
    begin try
        if not exists (select 1 from Orden where idOrden = @idOrden)
        begin
            throw 50001, 'La orden especificada no existe', 1;
        end;

        if exists (
            select 1 
            from Orden as o
            join Estados as e on o.estados_idEstados = e.idEstados
            where o.idOrden = @idOrden and e.nombre = 'Entregado'
        )
        begin
            throw 50003, 'La orden ya ha sido entregada y no se puede editar', 1;
        end;

        if exists (
            select 1 from OPENJSON(@detalles)
            with (productos_idProductos INT) as detalles
            where not exists (select 1 from Productos where idProductos = detalles.productos_idProductos)
        )
        begin
            throw 50002, 'Uno o mas productos especificados no existen', 1;
        end;

        delete from OrdenDetalles where orden_idOrden = @idOrden;

        insert into OrdenDetalles (
            orden_idOrden,
            productos_idProductos,
            cantidad,
            precio,
            subtotal
        )
        select
            @idOrden,
            productos_idProductos,
            cantidad,
            precio,
            cantidad * precio as subtotal
        from OPENJSON(@detalles)
        with (
            productos_idProductos INT,
            cantidad INT,
            precio FLOAT
        );

        update Orden
        set totalOrden = (
            select sum(subtotal)
            from OrdenDetalles
            where orden_idOrden = @idOrden
        )
        where idOrden = @idOrden;

        select * from Orden where idOrden = @idOrden;
        select * from OrdenDetalles where orden_idOrden = @idOrden;

        print('Orden editada correctamente');
        commit;
    end try
    begin catch
        rollback;
        throw;
    end catch;
end;
GO
/****** Object:  StoredProcedure [dbo].[s_insertarOrdenDetalles]    Script Date: 22/12/2024 05:25:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Insertar orden
create   proc [dbo].[s_insertarOrdenDetalles]
	@usuarios_idUsuarios INT,
	@detalles NVARCHAR(MAX)
as
begin
	begin transaction;
	begin try
		declare @idOrden INT;
		
		if not exists (select 1 from Usuarios where idUsuarios = @usuarios_idUsuarios and clientes_idClientes is not null)
		begin
			throw 50001, 'El usuario especificado no existe', 1;
		end;
		
		declare
			@nombreCompleto varchar(255),
			@direccion varchar(255),
			@telefono varchar(50),
			@correoElectronico varchar(255);
		
		select
			@nombreCompleto = u.nombreCompleto,
			@direccion = c.direccion,
			@telefono = u.telefono,
			@correoElectronico = u.correoElectronico
		from Clientes as c
		join Usuarios as u on c.idClientes = u.clientes_idClientes
		where u.idUsuarios = @usuarios_idUsuarios;
		
		--Insertar Orden
		insert into Orden (
			usuarios_idUsuarios,
			estados_idEstados,
			fechaCreacion,
			nombreCompleto,
			direccion,
			telefono,
			correoElectronico,
			fechaEntrega,
			totalOrden
		)
		values(
			@usuarios_idUsuarios,
			(select idEstados from Estados where nombre = 'Confirmado'),
			getdate(),
			@nombreCompleto,
			@direccion,
			@telefono,
			@correoElectronico,
			dateadd(day, 3, getdate()),
			0
		);
		
		set @idOrden = scope_identity();
		
		if exists (
			select 1 from OPENJSON(@detalles)
			with (productos_idProductos int) as detalles
			where not exists (select 1 from Productos where idProductos = detalles.productos_idProductos)
		)
		begin
			throw 50002, 'Uno o mas productos especificados no existe', 1;
		end;
		
		insert into OrdenDetalles (
			orden_idOrden,
			productos_idProductos,
			cantidad,
			precio,
			subtotal
		)
		select
			@idOrden,
			productos_idProductos,
			cantidad,
			precio,
			cantidad * precio as subtotal
		from OPENJSON(@detalles)
		with (
			productos_idProductos int,
			cantidad int,
			precio float
		);
		
		--Actualizar el total de la Orden
		update Orden
		set totalOrden = (
			select sum(subtotal)
			from OrdenDetalles
			where orden_idOrden = @idOrden
		)
		where idOrden = @idOrden;
		
		select * from Orden where idOrden = @idOrden;
		select * from OrdenDetalles where orden_idOrden = @idOrden;
		print('Orden insertada correctamente');
		commit;
	end try
	begin catch
		rollback;
		throw
	end catch;
end;
GO
USE [master]
GO
ALTER DATABASE [GDA00593_OT_HUGO_ORDONEZ] SET  READ_WRITE 
GO
