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

/* ------------------- Inserciones ------------------- */

/* USUARIO */
insert into usuario (nombre, documento, email, telefono, tipoUsuario) values
('admin principal', '1000000001', 'admin1@sistema.com', '3000000001', 'administrador'),

('carlos garcia', '1000000002', 'carlos.garcia@example.com', '3000000002', 'cliente'),
('maria rojas', '1000000003', 'maria.rojas@example.com', '3000000003', 'cliente'),
('andres perez', '1000000004', 'andres.perez@example.com', '3000000004', 'cliente'),
('julia fernandez', '1000000005', 'julia.fernandez@example.com', '3000000005', 'cliente'),
('diego ramirez', '1000000006', 'diego.ramirez@example.com', '3000000006', 'cliente'),
('laura mendoza', '1000000007', 'laura.mendoza@example.com', '3000000007', 'cliente'),
('sebastian torres', '1000000008', 'sebastian.torres@example.com', '3000000008', 'cliente'),
('camila suarez', '1000000009', 'camila.suarez@example.com', '3000000009', 'cliente'),
('felipe castro', '1000000010', 'felipe.castro@example.com', '3000000010', 'cliente'),

('alejandra lopez', '1000000011', 'alejandra.lopez@example.com', '3000000011', 'cliente'),
('santiago martinez', '1000000012', 'santiago.martinez@example.com', '3000000012', 'cliente'),
('valentina rios', '1000000013', 'valentina.rios@example.com', '3000000013', 'cliente'),
('daniel gomez', '1000000014', 'daniel.gomez@example.com', '3000000014', 'cliente'),
('paula sarmiento', '1000000015', 'paula.sarmiento@example.com', '3000000015', 'cliente'),
('julian herrera', '1000000016', 'julian.herrera@example.com', '3000000016', 'cliente'),
('tatiana salas', '1000000017', 'tatiana.salas@example.com', '3000000017', 'cliente'),
('mateo duarte', '1000000018', 'mateo.duarte@example.com', '3000000018', 'cliente'),
('sofia villalba', '1000000019', 'sofia.villalba@example.com', '3000000019', 'cliente'),
('ricardo nieves', '1000000020', 'ricardo.nieves@example.com', '3000000020', 'cliente'),

('natalia camacho', '1000000021', 'natalia.camacho@example.com', '3000000021', 'cliente'),
('esteban guerrero', '1000000022', 'esteban.guerrero@example.com', '3000000022', 'cliente'),
('karol jimenez', '1000000023', 'karol.jimenez@example.com', '3000000023', 'cliente'),
('manuel salazar', '1000000024', 'manuel.salazar@example.com', '3000000024', 'cliente'),
('angela cardenas', '1000000025', 'angela.cardenas@example.com', '3000000025', 'cliente'),
('tomás lópez', '1000000026', 'tomas.lopez@example.com', '3000000026', 'cliente'),
('isabella montoya', '1000000027', 'isabella.montoya@example.com', '3000000027', 'cliente'),
('cristian barrios', '1000000028', 'cristian.barrios@example.com', '3000000028', 'cliente'),
('mariana palacios', '1000000029', 'mariana.palacios@example.com', '3000000029', 'cliente'),
('hector zambrano', '1000000030', 'hector.zambrano@example.com', '3000000030', 'cliente'),

('daniela lozano', '1000000031', 'daniela.lozano@example.com', '3000000031', 'cliente'),
('adrian morales', '1000000032', 'adrian.morales@example.com', '3000000032', 'cliente'),
('lina castillo', '1000000033', 'lina.castillo@example.com', '3000000033', 'cliente'),
('jonathan correa', '1000000034', 'jonathan.correa@example.com', '3000000034', 'cliente'),
('valeria ortega', '1000000035', 'valeria.ortega@example.com', '3000000035', 'cliente'),
('david ospina', '1000000036', 'david.ospina@example.com', '3000000036', 'cliente'),
('sharon padilla', '1000000037', 'sharon.padilla@example.com', '3000000037', 'cliente'),
('cristobal arenas', '1000000038', 'cristobal.arenas@example.com', '3000000038', 'cliente'),
('michelle ardila', '1000000039', 'michelle.ardila@example.com', '3000000039', 'cliente'),
('simon valencia', '1000000040', 'simon.valencia@example.com', '3000000040', 'cliente'),

('lorena beltran', '1000000041', 'lorena.beltran@example.com', '3000000041', 'cliente'),
('victor cano', '1000000042', 'victor.cano@example.com', '3000000042', 'cliente'),
('diana escobar', '1000000043', 'diana.escobar@example.com', '3000000043', 'cliente'),
('jose muñoz', '1000000044', 'jose.munoz@example.com', '3000000044', 'cliente'),
('karen león', '1000000045', 'karen.leon@example.com', '3000000045', 'cliente'),
('fabian rodriguez', '1000000046', 'fabian.rodriguez@example.com', '3000000046', 'cliente'),
('gloria pinto', '1000000047', 'gloria.pinto@example.com', '3000000047', 'cliente'),
('samuel marin', '1000000048', 'samuel.marin@example.com', '3000000048', 'cliente'),
('emily soto', '1000000049', 'emily.soto@example.com', '3000000049', 'cliente'),
('nicolas rosero', '1000000050', 'nicolas.rosero@example.com', '3000000050', 'cliente');

/* EQUIPOS */
insert into equipo (tipoEquipo, marca, modelo, estado) values
('Portátil', 'HP', 'Pavilion 15', 'disponible'),
('Cámara', 'Canon', 'EOS 250D', 'disponible'),
('Tablet', 'Samsung', 'Galaxy Tab S7', 'prestado'),
('Proyector', 'Epson', 'X05+', 'disponible'),
('Portátil', 'Dell', 'Inspiron 14', 'disponible'),
('Cámara', 'Sony', 'Alpha 6000', 'prestado'),
('Tablet', 'Apple', 'iPad Air', 'disponible'),
('Proyector', 'BenQ', 'MS550', 'disponible'),
('Portátil', 'Lenovo', 'IdeaPad 3', 'prestado'),
('Cámara', 'Nikon', 'D3500', 'disponible'),

('Portátil', 'Asus', 'VivoBook 15', 'disponible'),
('Tablet', 'Huawei', 'MatePad 11', 'prestado'),
('Cámara', 'Fujifilm', 'X-T200', 'disponible'),
('Proyector', 'ViewSonic', 'PA503S', 'disponible'),
('Portátil', 'Acer', 'Aspire 5', 'prestado'),
('Cámara', 'Canon', 'EOS M50', 'disponible'),
('Tablet', 'Xiaomi', 'Pad 5', 'disponible'),
('Proyector', 'LG', 'PH550', 'prestado'),
('Portátil', 'Apple', 'MacBook Air M1', 'disponible'),
('Cámara', 'Sony', 'RX100 IV', 'disponible'),

('Tablet', 'Lenovo', 'Tab P11', 'prestado'),
('Proyector', 'Epson', 'EB-S41', 'disponible'),
('Portátil', 'HP', 'Envy x360', 'disponible'),
('Cámara', 'Nikon', 'Z50', 'prestado'),
('Tablet', 'Samsung', 'Galaxy Tab A8', 'disponible'),
('Proyector', 'BenQ', 'MH535FHD', 'disponible'),
('Portátil', 'Dell', 'Latitude 3420', 'prestado'),
('Cámara', 'Canon', 'EOS Rebel T7', 'disponible'),
('Tablet', 'Apple', 'iPad Mini 6', 'disponible'),
('Proyector', 'ViewSonic', 'M1+', 'prestado'),

('Portátil', 'Asus', 'ROG Zephyrus G14', 'disponible'),
('Cámara', 'Sony', 'Alpha 7 II', 'prestado'),
('Tablet', 'Huawei', 'MediaPad T5', 'disponible'),
('Proyector', 'Epson', 'EB-X06', 'disponible'),
('Portátil', 'Acer', 'Swift 3', 'prestado'),
('Cámara', 'Fujifilm', 'X-A7', 'disponible'),
('Tablet', 'Xiaomi', 'Redmi Pad', 'disponible'),
('Proyector', 'LG', 'HF60LS', 'prestado'),
('Portátil', 'Lenovo', 'ThinkPad E14', 'disponible'),
('Cámara', 'Nikon', 'Coolpix B500', 'disponible'),

('Tablet', 'Samsung', 'Galaxy Tab S9', 'prestado'),
('Proyector', 'BenQ', 'GS2', 'disponible'),
('Portátil', 'HP', 'ProBook 450', 'disponible'),
('Cámara', 'Canon', 'PowerShot G7X II', 'prestado'),
('Tablet', 'Apple', 'iPad Pro 11', 'disponible'),
('Proyector', 'Epson', 'VS260', 'disponible'),
('Portátil', 'Dell', 'XPS 13', 'prestado'),
('Cámara', 'Sony', 'Alpha 6400', 'disponible'),
('Tablet', 'Lenovo', 'Yoga Tab 13', 'disponible'),
('Proyector', 'ViewSonic', 'X10-4K', 'prestado');

/* PRÉSTAMOS */
insert into prestamo (idUsuarioFK, fechaPrestamo, fechaLimite, fechaDevolucion, estadoPrestamo) values
(1, '2025-01-10', '2025-01-20', null, 'activo'),
(1, '2025-02-01', '2025-02-10', '2025-02-08 14:20:00', 'devuelto'),
(2, '2025-03-05', '2025-03-15', null, 'vencido'),
(2, '2025-04-12', '2025-04-22', '2025-04-20 09:15:00', 'devuelto'),
(3, '2024-11-03', '2024-11-13', null, 'vencido'),
(3, '2024-12-20', '2024-12-30', '2024-12-28 17:40:00', 'devuelto'),
(3, '2025-02-14', '2025-02-24', null, 'activo'),
(4, '2025-01-02', '2025-01-12', null, 'vencido'),
(4, '2025-03-09', '2025-03-19', '2025-03-18 13:50:00', 'devuelto'),
(5, '2025-05-01', '2025-05-11', null, 'activo'),

(6, '2024-10-15', '2024-10-25', null, 'vencido'),
(6, '2025-02-05', '2025-02-15', '2025-02-14 11:30:00', 'devuelto'),
(7, '2025-03-18', '2025-03-28', null, 'activo'),
(8, '2025-01-27', '2025-02-06', '2025-02-05 16:50:00', 'devuelto'),
(8, '2025-04-01', '2025-04-11', null, 'activo'),
(9, '2025-02-22', '2025-03-04', null, 'vencido'),
(10, '2024-09-10', '2024-09-20', '2024-09-18 12:10:00', 'devuelto'),
(10, '2025-04-15', '2025-04-25', null, 'activo'),
(10, '2025-05-05', '2025-05-15', null, 'activo'),
(11, '2024-12-01', '2024-12-11', '2024-12-10 09:45:00', 'devuelto'),

(12, '2025-03-11', '2025-03-21', null, 'vencido'),
(12, '2025-04-10', '2025-04-20', '2025-04-19 18:30:00', 'devuelto'),
(13, '2025-02-25', '2025-03-07', null, 'activo'),
(13, '2024-08-14', '2024-08-24', '2024-08-21 15:40:00', 'devuelto'),
(14, '2025-01-19', '2025-01-29', null, 'activo'),
(15, '2025-04-06', '2025-04-16', null, 'vencido'),
(15, '2025-05-03', '2025-05-13', '2025-05-12 10:55:00', 'devuelto'),
(16, '2025-03-30', '2025-04-09', null, 'activo'),
(17, '2024-10-02', '2024-10-12', null, 'vencido'),
(17, '2025-02-18', '2025-02-28', '2025-02-27 11:10:00', 'devuelto'),

(18, '2025-03-14', '2025-03-24', null, 'activo'),
(19, '2025-01-09', '2025-01-19', '2025-01-17 14:30:00', 'devuelto'),
(19, '2025-04-21', '2025-05-01', null, 'activo'),
(20, '2024-11-11', '2024-11-21', null, 'vencido'),
(20, '2025-03-04', '2025-03-14', '2025-03-13 12:20:00', 'devuelto'),
(21, '2025-02-13', '2025-02-23', null, 'activo'),
(22, '2025-01-31', '2025-02-10', '2025-02-08 09:00:00', 'devuelto'),
(22, '2025-03-22', '2025-04-01', null, 'activo'),
(23, '2024-09-18', '2024-09-28', null, 'vencido'),
(23, '2025-04-29', '2025-05-09', '2025-05-08 16:45:00', 'devuelto'),

(24, '2025-03-02', '2025-03-12', null, 'activo'),
(25, '2024-12-22', '2025-01-01', null, 'vencido'),
(25, '2025-02-26', '2025-03-08', '2025-03-07 11:25:00', 'devuelto'),
(26, '2025-03-01', '2025-03-11', null, 'activo'),
(26, '2025-04-12', '2025-04-22', null, 'activo'),
(27, '2024-10-28', '2024-11-07', null, 'vencido'),
(28, '2025-02-07', '2025-02-17', '2025-02-16 14:00:00', 'devuelto'),
(29, '2025-03-09', '2025-03-19', null, 'activo'),
(29, '2025-05-02', '2025-05-12', null, 'activo'),
(30, '2024-12-30', '2025-01-09', null, 'vencido'),

(31, '2025-04-04', '2025-04-14', '2025-04-13 17:20:00', 'devuelto'),
(31, '2025-05-01', '2025-05-11', null, 'activo'),
(32, '2025-03-27', '2025-04-06', null, 'activo'),
(33, '2024-11-24', '2024-12-04', '2024-12-03 10:35:00', 'devuelto'),
(34, '2025-02-03', '2025-02-13', null, 'vencido'),
(35, '2024-08-16', '2024-08-26', '2024-08-25 12:15:00', 'devuelto'),
(36, '2025-01-14', '2025-01-24', null, 'activo'),
(36, '2025-02-28', '2025-03-10', null, 'vencido'),
(37, '2025-03-03', '2025-03-13', '2025-03-12 18:55:00', 'devuelto'),
(38, '2025-04-18', '2025-04-28', null, 'activo'),

(39, '2024-09-29', '2024-10-09', null, 'vencido'),
(40, '2025-05-01', '2025-05-11', '2025-05-10 08:40:00', 'devuelto');

/* EQUIPOS PRESTADOS */
insert into equiposPrestados (idPrestamoFK, idEquipoFK) values
(1, 5),
(2, 12),
(3, 7),
(4, 3),
(5, 18),
(6, 21),
(7, 4),
(7, 9),
(8, 11),
(9, 2),
(9, 15),
(10, 6),
(10, 14),
(11, 1),
(12, 8),
(12, 19),
(13, 10),
(14, 7),
(15, 13),
(15, 25),
(16, 5),
(17, 3),
(18, 9),
(19, 4),
(19, 16),
(20, 8),
(21, 11),
(22, 2),
(22, 17),
(23, 6),
(23, 14),
(23, 26),
(24, 1),
(25, 18),
(26, 7),
(27, 10),
(27, 22),
(28, 5),
(28, 13),
(29, 9),
(29, 15),
(30, 3),
(31, 12),
(31, 24),
(32, 4),
(33, 8),
(33, 11),
(34, 2),
(35, 19),
(35, 6),
(36, 14),
(37, 1),
(37, 17),
(38, 7),
(38, 22),
(39, 10),
(40, 5),
(41, 13),
(42, 9),
(42, 23),
(43, 3),
(43, 18),
(44, 4),
(45, 16),
(46, 8),
(46, 11),
(47, 2),
(48, 6),
(48, 24),
(49, 1),
(49, 17),
(50, 7),
(51, 10),
(52, 5),
(52, 13),
(53, 9),
(54, 3),
(55, 12),
(56, 4),
(57, 8),
(57, 26),
(58, 2),
(59, 6),
(60, 1),
(60, 25),
(61, 10),
(62, 5);

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

# RQF012 - Registrar préstamo – Alto nivel
insert into prestamo (idUsuarioFK, fechaPrestamo, fechaLimite, estadoPrestamo)
values (1, '2025-10-01', '2025-10-08', 'activo');
SET @lastPrestamoId = LAST_INSERT_ID();
insert into equiposPrestados (idPrestamoFK, idEquipoFK) values (@lastPrestamoId, 1);

# RQF013 - Modificar préstamo a devuelto – Alto nivel
update prestamo
set estadoPrestamo = 'devuelto'
where idPrestamo = 5;

# RQF018 - Extender fecha de devolución  
update prestamo
set fechaDevolucion = '2025-10-25'
where idPrestamo = 3 and estadoPrestamo = 'activo';

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

# RQF036 - Vista préstamos develtos
create view Vista_Préstamos_Devueltos as
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
where p.estadoPrestamo = 'devuelto';

# RQF037 - Vista de historial por cliente  
create view Vista_Historial_Cliente as
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
create view Vista_Inventario as
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    e.estado as 'Disponibilidad'
from equipo e
order by e.tipoEquipo, e.idEquipo;

# RQF039 - Vista equipos más usados del mes
create view Vista_Equipos_más_Usados as
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(ep.idPrestamoFK) as 'Cantidad de Préstamos'
from equipo e
inner join equiposPrestados ep on e.idEquipo = ep.idEquipoFK
inner join prestamo p on ep.idPrestamoFK = p.idPrestamo
where month(p.fechaPrestamo) = 10
  and year(p.fechaPrestamo) = 2024
group by e.idEquipo
order by count(ep.idPrestamoFK) desc;

# RQF014 - Actualizar estado de equipo a prestado
DELIMITER $$
create trigger actualizarEquipoPrestado
after insert 
on equiposPrestados
for each row
begin
	update equipo set estado = 'prestado'
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

/* ---------- VER EN METABASE ---------- */
# RQF004 - Consultar lista de equipos
select * from equipo;

# RQF010 - Consultar lista de clientes
select * from usuario;

# RQF005 - Consultar lista de equipos disponibles
create view Vista_Equipos_Disponibles as
select * from equipo
where estado = 'disponible';

# RQF006 - Consultar disponibilidad de equipo por tipo de equipo - Metabase
select idEquipo, tipoEquipo, marca, modelo, estado
from equipo
where tipoEquipo like '%portátil%';

# RQF011 - Consultar préstamos por idUsuario - Metabase
select * from prestamo
where idUsuarioFK = 3;

# RQF019 - Consultar préstamo por estado – Alto nivel - Metabase
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
create view Vista_Prestamos_Detallados as select 
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

# RQF021 - Consultar préstamo por equipo - Metabase
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

# RQF022 - Consultar detalladamente los préstamos de un usuario - Metabase
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
create view Vista_Equipo_Más_Prestado as
select 
    e.idEquipo as 'ID Equipo', e.tipoEquipo as 'Tipo de equipo', e.marca as 'Marca',
    e.modelo as 'Modelo', count(ep.idPrestamoFK) as 'Cantidad de Préstamos'
from equipo e
inner join equiposPrestados ep on e.idEquipo = ep.idEquipoFK
group by e.idEquipo
order by count(ep.idPrestamoFK) desc limit 1;
 
-- Encontramos que utilizar el limit 1 es más eficiente que realizar una subconsulta para buscar el más prestado

# RQF024 - Consultar lista de préstamos
select * from prestamo;

# RQF025 - Consulta equipos por orden de solicitud
create view Vista_Equipos_por_Orden_de_Solicitud as
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
create view Vista_Préstamos_Vencidos as
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
create view Vista_Equipos_más_Prestados_del_Mes as
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
create view Vista_Disponibilidad_y_Préstamos_de_Equipos as
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

# RQF029 - Consulta préstamos por tipo de equipo - Metabase
select 
    e.tipoEquipo as 'Tipo de equipo',
    count(ep.idPrestamoFK) as 'Cantidad de préstamos realizados'
from equiposPrestados ep
inner join equipo e on ep.idEquipoFK = e.idEquipo
group by e.tipoEquipo
order by count(ep.idPrestamoFK) desc;

# RQF030 - Consultar clientes con préstamos activos  
create view Vista_Clientes_con_Préstamos_Activos as
select 
    u.idUsuario as 'ID Usuario',
    u.nombre as 'Nombre de Usuario',
    count(p.idPrestamo) as 'Cantidad de préstamos activos'
from usuario u
inner join prestamo p on u.idUsuario = p.idUsuarioFK
where p.estadoPrestamo = 'activo'
group by u.idUsuario
order by count(p.idPrestamo) desc;
