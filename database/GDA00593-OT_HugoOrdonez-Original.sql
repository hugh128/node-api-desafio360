-- Crear base de datos
create database GDA00593_OT_HUGO_ORDONEZ;
GO
use GDA00593_OT_HUGO_ORDONEZ;

-- Crear tablas
--Tabla estados
create table Estados(
	idEstados int identity primary key,
	nombre varchar(45) not null unique
);

--Tabla rol
create table Rol(
idRol int identity primary key,
nombre varchar(45) not null unique
);

--Tabla clientes
create table Clientes(
	idClientes int identity primary key,
	razonSocial varchar(245) default 'Sin razon social',
	nombreComercial varchar(545) not null,
	direccion varchar(545) not null,
	telefono varchar(45) not null,
	email varchar(100) not null,
	CONSTRAINT CK_cliente_email CHECK (email LIKE '%_@__%.__%')
);

--Tabla usuarios
create table Usuarios(
	idUsuarios int identity primary key,
	rol_idRol int not null,
	estados_idEstados int not null,
	correoElectronico varchar(100) not null unique,
	nombreCompleto varchar(245) not null,
	password varchar(255) not null,
	telefono varchar(45) not null,
	fechaNacimiento date not null,
	fechaCreacion datetime not null,
	clientes_idClientes int,
	constraint FK_usuarios_rol foreign key (rol_idRol) references Rol(idRol),
	constraint FK_usuarios_estados foreign key (estados_idEstados) references Estados(idEstados),
	constraint FK_usuarios_clientes foreign key (clientes_idClientes) references Clientes(idClientes),
	CONSTRAINT CK_usuarios_email CHECK (correoElectronico LIKE '%_@__%.__%')
);

--Tabla categoria productos
create table CategoriaProductos(
	idCategoriaProductos int identity primary key,
	usuarios_idUsuarios int not null,
	nombre varchar(45) not null,
	estados_idEstados int not null,
	fechaCreacion datetime,
	constraint FK_categoriaPro_usuarios foreign key (usuarios_idUsuarios) references Usuarios(idUsuarios),
	constraint FK_categoriaPro_estados foreign key (estados_idEstados) references Estados(idEstados)
);

--Tabla productos
create table Productos(
	idProductos int identity primary key,
	categoriaProductos_idCategoriaProductos int not null,
	usuarios_idUsuarios int not null,
	nombre varchar(45) not null,
	marca varchar(45) not null,
	codigo varchar(45) not null,
	stock float not null,
	estados_idEstados int not null,
	precio float not null,
	fechaCreacion datetime not null,
	foto binary,
	constraint FK_productos_categoria foreign key (categoriaProductos_idCategoriaProductos) references CategoriaProductos(idCategoriaProductos),
	constraint FK_productos_usuarios foreign key (usuarios_idUsuarios) references Usuarios(idUsuarios),
	constraint FK_productos_estados foreign key (estados_idEstados) references Estados(idEstados)
);

--Tabla Orden
create table Orden(
	idOrden int identity primary key,
	usuarios_idUsuarios int not null,
	estados_idEstados int not null,
	fechaCreacion datetime not null,
	nombreCompleto varchar(245) not null,
	direccion varchar(545) not null,
	telefono varchar(45) not null,
	correoElectronico varchar(100) not null,
	fechaEntrega date not null,
	totalOrden float not null,
	constraint FK_orden_usuarios foreign key (usuarios_idUsuarios) references Usuarios(idUsuarios),
	constraint FK_orden_estados foreign key (estados_idEstados) references Estados(idEstados)
);

--Tabla orden detalles
create table OrdenDetalles(
	idOrdenDetalles int identity primary key,
	orden_idOrden int not null,
	productos_idProductos int not null,
	cantidad int not null,
	precio float not null,
	subtotal float not null,
	constraint FK_ordenDet_orden foreign key (orden_idOrden) references Orden(idOrden) On update cascade On delete cascade,
	constraint FK_ordenDet_productos foreign key (productos_idProductos) references Productos(idProductos)
);
GO

-- Procedimientos
--Insertar estado
create or alter proc p_insertarEstado
	@nombre varchar(45)
as
begin
	insert into Estados (nombre)
	values (@nombre);
	select SCOPE_IDENTITY() as ID;
	print('Estado agregado correctamente');
end;
GO

exec p_insertarEstado @nombre = 'Activo';
GO

--Actualizar estado
create or alter proc p_actualizarEstado
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

--Insertar rol
create or alter proc p_insertarRol
	@nombre varchar(45)
as
begin
	insert into Rol (nombre)
	values (@nombre);
	select SCOPE_IDENTITY() as ID;
	print('Rol agregado correctamente');
end;
GO

exec p_insertarRol @nombre = 'Administrador';
GO

--Actualizar rol
create or alter proc p_actualizarRol
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

--Insertar clientes
create or alter proc p_insertarClientes
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

--Actualizar clientes
create or alter proc p_actualizarCliente
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

--Insertar usuario
create or alter proc p_insertarUsuario
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

exec p_insertarUsuario
	@rol_nombre = 'Administrador', @estados_nombre = 'Activo', --Administrador
	@correoElectronico = 'admin@empresa.com', @nombreCompleto = 'Administrador Principal',
	@password = '$2a$10$GfU.3tQcndoITbrG4C7eGeGSV2xciiqB1vLe8iVq1Ev9gaFJCr63q', @telefono = '14567890', @fechaNacimiento = '1980-01-15', @clientes_idClientes = NULL;
GO

--Actualizar Usuario
create or alter proc p_actualizarUsuario
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

--Actualizar estado de usuario
create or alter proc p_actualizarEstadoUsuario
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

--Buscar usuario por correo
CREATE OR ALTER PROCEDURE p_obtenerUsuarioPorCorreo
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

--Insertar categoria de productos
create or alter proc p_insertarCategoriaProductos
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

--Actualizar categoria de productos
create or alter proc p_actualizarCategoriaProductos
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

--Actualizar estado de categoria de producto
create or alter proc p_actualizarEstadoCategoriaProductos
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

-- Insertar productos
create or alter proc p_insertarProducto
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

-- Actualizar producto
create or alter proc p_actualizarProducto
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

--Actualizar estado del producto
create or alter proc p_actualizarEstadoProducto
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

--Insertar orden
create or alter proc s_insertarOrdenDetalles
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

--Agregar o eliminar productos a la orden
create or alter proc s_editarOrden
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

--Actualizar estado de Orden
create or alter proc p_cambiarEstadoOrden
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

-- Vistas
--a. Total de Productos activos que tenga en stock mayor a 0
create or alter view v_totalProductosActivos as
select 
    sum(p.stock * p.precio) as total_inventario
from Productos p
inner join Estados e on p.estados_idEstados = e.idEstados
where e.nombre = 'Activo' and p.stock > 0;
GO

select * from v_totalProductosActivos;
GO

create or alter view v_productosActivosStock as
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

select * from v_productosActivosStock;
GO

--b. Total de Quetzales en ordenes ingresadas en el mes de Agosto 2024
create or alter view v_totalOrdenesAgosto2024 as
select 
    sum(o.totalOrden) as total_quetzales
from Orden o
where o.fechaCreacion >= '2024-08-01' and o.fechaCreacion < '2024-09-01';
GO

select * from v_totalOrdenesAgosto2024;
GO
--c. Top 10 de clientes con Mayor consumo de ordenes de todo el histórico
create or alter view v_Top10ClientesConsumo as
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

select * from v_Top10ClientesConsumo;
GO

--d. Top 10 de productos más vendidos en orden ascendente
create or alter view v_top10ProductosMasVendidos as
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

select * from v_top10ProductosMasVendidos;
GO