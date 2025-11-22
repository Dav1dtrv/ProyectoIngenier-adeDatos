create database spCorregido;
use spCorregido;

create table usuario(
    idUsuario int auto_increment primary key,
    nombre varchar(100) not null,
    documento varchar(50) unique not null,
    email varchar(100) not null,
    telefono varchar(20),
    tipoUsuario enum('cliente','administrador') default 'cliente'
);

create table equipo(
    idEquipo int auto_increment primary key,
    tipoEquipo varchar(100) not null,
    marca varchar(50) not null,
    modelo varchar(50),
    estado enum('disponible', 'prestado') default 'disponible'
);

create table prestamo(
    idPrestamo int auto_increment primary key,
    idUsuarioFK int not null,
    fechaPrestamo date not null,
    fechaLimite date not null,
    fechaDevolucion datetime null,
    estadoPrestamo enum('activo', 'devuelto', 'vencido') default 'activo',
    foreign key (idUsuarioFK) references usuario(idUsuario)
);

create table equiposPrestados(
    idEquiposPrestados int auto_increment primary key,
    idPrestamoFK int not null,
    idEquipoFK int not null,
    foreign key (idPrestamoFK) references prestamo(idPrestamo),
    foreign key (idEquipoFK) references equipo(idEquipo)
);

/* ------------------- Consultas Básicas ------------------- */

select * from usuario;
select * from equipo;
select * from prestamo;
select * from equiposPrestados;

/* ------------------- Consultas específicas ------------------- */

# USUARIO ----------------- 
# 1. Mostrar solo los nombres y correos de los usuarios
select nombre, email from usuario;

# 2. Listar los usuarios que son administradores
select * from usuario where tipoUsuario = 'administrador';

# 3. Contar cuántos usuarios son clientes
select count(*) as totalClientes from usuario where tipoUsuario = 'cliente';

# 4. Obtener los usuarios cuyo nombre empieza por 'C'
select * from usuario where nombre like 'C%';

# 5. Mostrar el usuario con el documento '1012345678'
select * from usuario where documento = '1012345678';

# 6. Listar usuarios ordenados alfabéticamente por nombre
select * from usuario order by nombre asc;

# 7. Mostrar los usuarios que no tienen número de teléfono registrado
select * from usuario where telefono = '' or telefono is null;

# EQUIPO ----------------- 
# 1. Mostrar los equipos disponibles
select * from equipo where estado = 'disponible';

# 2. Contar cuántos equipos hay por tipo
select tipoEquipo, count(*) as cantidad from equipo group by tipoEquipo;

# 3. Mostrar los equipos que están prestados
select * from equipo where estado = 'prestado';

# 4. Mostrar los equipos prestados y de la marca 'HP'
select * from equipo where estado = 'prestado' and marca = 'HP';

# 5. Mostrar los equipos de la marca 'HP'
select * from equipo where marca = 'HP';

# 6. Mostrar los modelos que contienen la palabra 'Idea'
select * from equipo where modelo like '%Idea%';

# 7. Ordenar los equipos por marca y tipo
select * from equipo order by marca, tipoEquipo;

# PRESTAMO ----------------- 
# 1. Mostrar todos los préstamos activos
select * from prestamo where estadoPrestamo = 'activo';

# 2. Contar los préstamos devueltos
select count(*) as totalDevueltos from prestamo where estadoPrestamo = 'devuelto';

# 3. Listar los préstamos vencidos con sus fechas
select idPrestamo, fechaPrestamo, fechaLimite from prestamo where estadoPrestamo = 'vencido';

# 4. Mostrar los préstamos realizados por el usuario con idUsuarioFK = 3
select * from prestamo where idUsuarioFK = 3;

# 5. Mostrar los préstamos del mes de septiembre de 2025
select * from prestamo where month(fechaPrestamo) = 9 and year(fechaPrestamo) = 2025;

# 6. Mostrar los préstamos junto al estado del equipo (usando join)
select p.idPrestamo, e.tipoEquipo, e.marca, p.estadoPrestamo
from prestamo p
join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
join equipo e on ep.idEquipoFK = e.idEquipo;

# 7. Obtener el total de préstamos por estado
select estadoPrestamo, count(*) as cantidad
from prestamo
group by estadoPrestamo;

/* ------------------- Modificaciones (no ejecutadas) ------------------- */
# 1. Actualizar el correo electrónico de un usuario específico
update usuario
set email = 'nuevo.correo@gmail.com'
where idUsuario = 3;

# 2. Cambiar el estado de un equipo a 'dañado'
update equipo
set estado = 'prestado'
where idEquipo = 5;

# 3. Marcar un préstamo como devuelto y agregar la fecha de devolución
update prestamo
set estadoPrestamo = 'devuelto', fechaDevolucion = '2025-10-15'
where idPrestamo = 3;

# 4. Modificar el tipo de usuario de 'cliente' a 'administrador'
update usuario
set tipoUsuario = 'administrador'
where idUsuario = 7;

# 5. Actualizar el modelo y marca de un equipo
update equipo
set marca = 'Acer', modelo = 'Aspire 5'
where idEquipo = 1;

/* ------------------- Eliminación (no ejecutada) ------------------- */
# Eliminar un registro de préstamo por su id
delete from equiposPrestados where idPrestamoFK = 10;
delete from prestamo where idPrestamo = 10;

/* ------------------- Requisitos Funcionales ------------------- */
# RQF001 - Registrar equipo
insert into equipo (tipoEquipo, marca, modelo, estado)
values ('portátil', 'acer', 'aspire 5', 'disponible');

# RQF002 - Modificar equipo
update equipo
set marca = 'hp', modelo = 'pavilion x360'
where idEquipo = 1;

# RQF003 - Eliminar equipo
delete from equiposPrestados where idEquipoFK = 5;
delete from equipo where idEquipo = 5;

# RQF004 - Consultar lista de equipos
select * from equipo;

# RQF005 - Consultar lista de equipos disponibles
select * from equipo
where estado = 'disponible';

# RQF006 - Consultar disponibilidad de equipo por nombre o código
select idEquipo, tipoEquipo, marca, modelo, estado
from equipo
where idEquipo = 3 or tipoEquipo like '%portátil%';

# RQF007 - Registrar cliente nuevo
insert into usuario (nombre, documento, email, telefono, tipoUsuario)
values ('juliana castillo', '1099998888', 'juliana.castillo@gmail.com', '3126789900', 'cliente');

# RQF008 - Modificar cliente
update usuario
set telefono = '3004567890', email = 'juliana.castillo_actualizado@gmail.com'
where idUsuario = 1;

# RQF009 - Eliminar cliente
delete from usuario
where idUsuario = 4;

# RQF010 - Consultar lista de clientes
select * from usuario;

# RQF011 - Consultar préstamos por idUsuario
select * from prestamo
where idUsuarioFK = 3;

# RQF012 - Registrar préstamo – Alto nivel
insert into prestamo (idUsuarioFK, fechaPrestamo, fechaLimite, estadoPrestamo)
values (1, '2025-10-01', '2025-10-08', 'activo');
SET @lastPrestamoId = LAST_INSERT_ID();
insert into equiposPrestados (idPrestamoFK, idEquipoFK) values (@lastPrestamoId, 1);

# RQF013 - Modificar préstamo a devuelto – Alto nivel
update prestamo
set estadoPrestamo = 'devuelto'
where idPrestamo = 5;

# RQF014 - Actualizar estado de equipo a prestado
DELIMITER $$
create trigger actualizarEquipoPrestado
after insert 
on equiposPrestados
for each row
begin
	update equipo set estado = 'no disponible'
	where idEquipo = new.idEquipoFK;
end $$ 
DELIMITER ;

# RQF015 - No permitir préstamo de equipos no disponibles
DELIMITER $$
create trigger verificarDisponibilidadEquipo
before insert 
on equiposPrestados
for each row
begin
    if (select estado from equipo where idEquipo = new.idEquipoFK) != 'disponible' then
        signal sqlstate '45000'
        set message_text = 'El equipo no está disponible para préstamo.';
    end if;
end $$
DELIMITER ;

# RQF016 - Modificar el estado de un equipo cuando es devuelto
DELIMITER $$
create trigger actualizarEquipoDisponible
after update 
on prestamo
for each row
begin
    if new.estadoPrestamo = 'devuelto' and old.estadoPrestamo != 'devuelto' then
        update equipo e
        join equiposPrestados ep on e.idEquipo = ep.idEquipoFK
        set e.estado = 'disponible'
        where ep.idPrestamoFK = new.idPrestamo;
    end if;
end $$
DELIMITER ;

# RQF017 - Registrar fecha de devolución  
DELIMITER $$
create trigger registrarFechaDevolucion
before update 
on prestamo
for each row
begin
    if new.estadoPrestamo = 'devuelto' and old.estadoPrestamo != 'devuelto' then
        set new.fechaDevolucion = now();
    end if;
end $$
DELIMITER ;

# RQF018 - Extender fecha de devolución  
update prestamo
set fechaDevolucion = '2025-10-25'
where idPrestamo = 3 and estadoPrestamo = 'activo';

# RQF019 - Consultar préstamo por estado – Alto nivel
select 
    p.idPrestamo as 'ID Préstamo',
    u.nombre as 'Nombre de Usuario',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    p.fechaPrestamo as 'Fecha Préstamo',
    p.fechaLimite as 'Fecha Límite',
    p.fechaDevolucion as 'Fecha Devolución',
    p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'activo';

# RQF020 - Consultar lista de préstamos
select 
    p.idPrestamo as 'ID Préstamo',
    u.nombre as 'Nombre de Usuario',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    p.fechaPrestamo as 'Fecha Préstamo',
    p.fechaLimite as 'Fecha Límite',
    p.fechaDevolucion as 'Fecha Devolución',
    p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
order by p.estadoPrestamo, p.fechaPrestamo desc;

# RQF021 - Consultar préstamo por equipo
select 
    p.idPrestamo as 'ID Préstamo',
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    u.nombre as 'Nombre de Usuario',
    p.fechaPrestamo as 'Fecha Préstamo',
    p.fechaDevolucion as 'Fecha Devolución',
    p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
inner join usuario u on p.idUsuarioFK = u.idUsuario
where e.idEquipo = 2;

# RQF022 - Consultar detalladamente los préstamos de un usuario
select 
    p.idPrestamo as 'ID Préstamo',
    u.idUsuario as 'ID Usuario',
    u.nombre as 'Nombre de Usuario',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    p.fechaPrestamo as 'Fecha Préstamo',
    p.fechaDevolucion as 'Fecha Devolución',
    p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
where u.idUsuario = 4;

# RQF023 - Consultar equipo más prestado – Alto nivel
select 
    e.idEquipo as 'ID Equipo', e.tipoEquipo as 'Tipo de equipo', e.marca as 'Marca',
    e.modelo as 'Modelo', count(ep.idPrestamoFK) as 'Cantidad de Préstamos'
from equipo e
inner join equiposPrestados ep on e.idEquipo = ep.idEquipoFK
group by e.idEquipo
order by count(ep.idPrestamoFK) desc limit 1;
 
-- Encontramos que utilizar el limit 1 es más eficiente que realizar una subconsulta para buscar el más prestado

# RQF024 - Consulta de préstamos activos con detalle del cliente
select 
    p.idPrestamo as 'ID Préstamo',
    u.idUsuario as 'ID Usuario',
    u.nombre as 'Nombre del Cliente',
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    p.fechaPrestamo as 'Fecha Préstamo',
    p.fechaDevolucion as 'Fecha Devolución',
    p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'activo';

# RQF025 - Consulta equipos por orden de solicitud
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(ep.idPrestamoFK) as 'Cantidad de Préstamos'
from equipo e
left join equiposPrestados ep on e.idEquipo = ep.idEquipoFK
group by e.idEquipo, e.tipoEquipo, e.marca, e.modelo
order by count(ep.idPrestamoFK) desc;

# RQF026 - Detección de préstamos vencidos – Alto nivel
select 
    p.idPrestamo as 'ID Préstamo', u.nombre as 'Nombre del Cliente', e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca', e.modelo as 'Modelo', p.fechaPrestamo as 'Fecha Préstamo', p.fechaLimite as 'Fecha Límite', 
    p.fechaDevolucion as 'Fecha Devolución', p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'vencido';

# RQF027 - Consultar equipos más prestados del mes  
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(ep.idPrestamoFK) as 'Cantidad de préstamos'
from equiposPrestados ep
inner join equipo e on ep.idEquipoFK = e.idEquipo
inner join prestamo p on ep.idPrestamoFK = p.idPrestamo
where month(p.fechaPrestamo) = month(curdate())
and year(p.fechaPrestamo) = year(curdate())
group by e.idEquipo
order by count(ep.idPrestamoFK) desc;

# RQF028 - Consulta disponibilidad y préstamos de los equipos
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    e.estado as 'Estado actual',
    count(ep.idPrestamoFK) as 'Total de préstamos realizados'
from equipo e
left join equiposPrestados ep on e.idEquipo = ep.idEquipoFK
where e.estado = 'disponible'
group by e.idEquipo
order by count(ep.idPrestamoFK) desc;

# RQF029 - Consulta préstamos por tipo de equipo  
select 
    e.tipoEquipo as 'Tipo de equipo',
    count(ep.idPrestamoFK) as 'Cantidad de préstamos realizados'
from equiposPrestados ep
inner join equipo e on ep.idEquipoFK = e.idEquipo
group by e.tipoEquipo
order by count(ep.idPrestamoFK) desc;

# RQF030 - Consultar clientes con préstamos activos  
select 
    u.idUsuario as 'ID Usuario',
    u.nombre as 'Nombre de Usuario',
    count(p.idPrestamo) as 'Cantidad de préstamos activos'
from usuario u
inner join prestamo p on u.idUsuario = p.idUsuarioFK
where p.estadoPrestamo = 'activo'
group by u.idUsuario
order by count(p.idPrestamo) desc;

# RQF031 - Procedimiento de registro de préstamo  
DELIMITER $$
create procedure registrarPrestamo(
    in p_idUsuario int,
    in p_idEquipo int,
    in p_fechaPrestamo date,
    in p_fechaLimite date
)
begin
    declare v_newPrestamoId int;

    insert into prestamo(idUsuarioFK, fechaPrestamo, fechaLimite, estadoPrestamo)
    values(p_idUsuario, p_fechaPrestamo, p_fechaLimite, 'activo');

    set v_newPrestamoId = LAST_INSERT_ID();

    insert into equiposPrestados (idPrestamoFK, idEquipoFK)
    values (v_newPrestamoId, p_idEquipo);
end $$
DELIMITER ;

# RQF032 - Procedimiento registro de devolución  
DELIMITER $$
create procedure registrarDevolucion (
    in p_idPrestamo int,
    in p_fechaDevolucion datetime
)
begin
    update prestamo
    set fechaDevolucion = p_fechaDevolucion,
        estadoPrestamo = 'devuelto'
    where idPrestamo = p_idPrestamo;
end $$
DELIMITER ;

# RQF033 - Actualizar estado de préstamos vencidos
DELIMITER $$
create procedure actualizarPrestamosVencidos ()
begin
    update prestamo
    set estadoPrestamo = 'vencido'
    where estadoPrestamo = 'activo'
      and fechaLimite < curdate();
end $$
DELIMITER ;

# RQF034 - Procedimiento préstamos por usuario en un tiempo determinado
DELIMITER $$
create procedure prestamosPorUsuario (
    in p_idUsuario int,
    in p_fechaInicio date,
    in p_fechaFin date
)
begin
    select 
        u.idUsuario as 'ID Usuario',
        u.nombre as 'Nombre del Usuario',
        count(p.idPrestamo) as 'Total de Préstamos',
        min(p.fechaPrestamo) as 'Primer Préstamo en Rango',
        max(p.fechaPrestamo) as 'Último Préstamo en Rango'
    from usuario u
    inner join prestamo p on u.idUsuario = p.idUsuarioFK
    where u.idUsuario = p_idUsuario
      and p.fechaPrestamo between p_fechaInicio and p_fechaFin
    group by u.idUsuario, u.nombre;
end $$
DELIMITER ;

# RQF035 - Procedimiento limpieza de préstamos  
DELIMITER $$
create procedure limpiarPrestamosAntiguos ()
begin
	delete ep
    from equiposPrestados ep
    inner join prestamo p on ep.idPrestamoFK = p.idPrestamo
    where datediff(curdate(), p.fechaPrestamo) > 365;
    
    delete from prestamo
    where datediff(curdate(), fechaPrestamo) > 365;
end $$
DELIMITER ;

# RQF036 - Vista préstamos activos  
create view vistaPrestamosActivos as
select 
    p.idPrestamo as 'ID Préstamo',
    u.nombre as 'Nombre de Usuario',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    p.fechaPrestamo as 'Fecha Préstamo',
    p.fechaLimite as 'Fecha Límite',
    p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'activo';

# RQF037 - Vista de historial por cliente  
create view vistaHistorialCliente as
select 
    u.idUsuario as 'ID Usuario',
    u.nombre as 'Nombre de Usuario',
    p.idPrestamo as 'ID Préstamo',
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de Equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    p.fechaPrestamo as 'Fecha de préstamo',
    p.fechaLimite as 'Fecha límite',
    p.fechaDevolucion as 'Fecha devolución',
    p.estadoPrestamo as 'Estado del préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equiposPrestados ep on p.idPrestamo = ep.idPrestamoFK
inner join equipo e on ep.idEquipoFK = e.idEquipo
order by u.idUsuario, p.fechaPrestamo desc;

# RQF038 - Vista inventario  
create view vistaInventario as
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    e.estado as 'Disponibilidad'
from equipo e
order by e.tipoEquipo, e.idEquipo;

# RQF039 - Vista equipos más usados del mes
create view vistaEquiposMasUsados as
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(ep.idPrestamoFK) as 'Cantidad de Préstamos'
from equipo e
inner join equiposPrestados ep on e.idEquipo = ep.idEquipoFK
inner join prestamo p on ep.idPrestamoFK = p.idPrestamo
where month(p.fechaPrestamo) = month(curdate())
  and year(p.fechaPrestamo) = year(curdate())
group by e.idEquipo
order by count(ep.idPrestamoFK) desc;

# RQF040 - Restricción para la eliminación de equipos  
DELIMITER $$
create trigger beforeDeleteEquipo
before delete
on equipo
for each row
begin	
    declare prestamosActivos int;

    select count(*) into prestamosActivos
    from equiposPrestados ep
    inner join prestamo p on ep.idPrestamoFK = p.idPrestamo
    where ep.idEquipoFK = old.idEquipo
      and p.estadoPrestamo = 'activo';


    if prestamosActivos > 0 then
        signal sqlstate '45000'
        set message_text = 'No se puede eliminar el equipo porque tiene préstamos activos.';
    end if;
end $$ 
DELIMITER ;
