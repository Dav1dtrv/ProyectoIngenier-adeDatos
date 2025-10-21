create database sistemaPrestamo;
use sistemaPrestamo;

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
estado enum('disponible', 'prestado', 'dañado') default 'disponible'
);

create table prestamo(
idPrestamo int auto_increment primary key,
idEquipoFK int not null,
idUsuarioFK int not null,
fechaPrestamo date not null,
fechaLimite date not null,              
fechaDevolucion datetime null,
estadoPrestamo enum('activo', 'devuelto', 'vencido') default'activo',
foreign key (idEquipoFK) references equipo(idEquipo),
foreign key (idUsuarioFK) references usuario(idUsuario)
);

/* ------------------- Inserciones ------------------- */

# USUARIOS - Primeras 10
insert into usuario (nombre, documento, email, telefono, tipoUsuario) values
('Carlos Pérez', '1023456789', 'carlos.perez@gmail.com', '3105678923', 'cliente'),
('María Gómez', '1009876543', 'maria.gomez@gmail.com', '3158790345', 'cliente'),
('Laura Torres', '1014567890', 'laura.torres@gmail.com', '3124567809', 'cliente'),
('Jorge Ramírez', '1034567891', 'jorge.ramirez@gmail.com', '3007894561', 'cliente'),
('Andrés López', '1098765432', 'andres.lopez@gmail.com', '3219876543', 'cliente'),
('Sofía Hernández', '1076543210', 'sofia.hernandez@gmail.com', '3161237890', 'cliente'),
('Paula Díaz', '1056789123', 'paula.diaz@gmail.com', '3145678912', 'cliente'),
('Camilo Rojas', '1087654321', 'camilo.rojas@gmail.com', '3201234567', 'administrador'),
('Valentina Ruiz', '1045678912', 'valentina.ruiz@gmail.com', '3113456789', 'cliente'),
('Sebastián Arias', '1012345678', 'sebastian.arias@gmail.com', '3176543210', 'administrador');

# USUARIOS - 40 restantes
insert into usuario (nombre, documento, email, telefono, tipoUsuario) values
('Daniel Castro', '1101234567', 'daniel.castro@gmail.com', '3009876541', 'cliente'),
('Natalia Rincón', '1102345678', 'natalia.rincon@gmail.com', '3124567891', 'cliente'),
('Andrés Mejía', '1103456789', 'andres.mejia@gmail.com', '3156789012', 'cliente'),
('Lucía Ramírez', '1104567890', 'lucia.ramirez@gmail.com', '3102345678', 'cliente'),
('Felipe Torres', '1105678901', 'felipe.torres@gmail.com', '3205678901', 'cliente'),
('Mónica Herrera', '1106789012', 'monica.herrera@gmail.com', '3167890123', 'cliente'),
('Julián Gómez', '1107890123', 'julian.gomez@gmail.com', '3118901234', 'cliente'),
('Camila Vargas', '1108901234', 'camila.vargas@gmail.com', '3179012345', 'cliente'),
('Ricardo Silva', '1109012345', 'ricardo.silva@gmail.com', '3140123456', 'cliente'),
('Valeria Moreno', '1110123456', 'valeria.moreno@gmail.com', '3181234567', 'cliente'),

('Tomás Castillo', '1111234567', 'tomas.castillo@gmail.com', '3122345678', 'cliente'),
('Diana Pardo', '1112345678', 'diana.pardo@gmail.com', '3133456789', 'cliente'),
('Santiago Duarte', '1113456789', 'santiago.duarte@gmail.com', '3114567890', 'cliente'),
('Laura Fernández', '1114567890', 'laura.fernandez@gmail.com', '3105678901', 'cliente'),
('Carlos López', '1115678901', 'carlos.lopez@gmail.com', '3156789012', 'cliente'),
('Mariana Jiménez', '1116789012', 'mariana.jimenez@gmail.com', '3167890123', 'cliente'),
('Esteban Molina', '1117890123', 'esteban.molina@gmail.com', '3178901234', 'cliente'),
('Paola Guerrero', '1118901234', 'paola.guerrero@gmail.com', '3189012345', 'cliente'),
('David Arias', '1119012345', 'david.arias@gmail.com', '3190123456', 'cliente'),
('Isabela Rojas', '1120123456', 'isabela.rojas@gmail.com', '3121234567', 'cliente'),

('Mateo García', '1121234567', 'mateo.garcia@gmail.com', '3132345678', 'cliente'),
('Valentina Suárez', '1122345678', 'valentina.suarez@gmail.com', '3143456789', 'cliente'),
('Juan Ortega', '1123456789', 'juan.ortega@gmail.com', '3154567890', 'cliente'),
('Laura Peña', '1124567890', 'laura.pena@gmail.com', '3165678901', 'cliente'),
('Samuel Vargas', '1125678901', 'samuel.vargas@gmail.com', '3176789012', 'cliente'),
('Nicole Serrano', '1126789012', 'nicole.serrano@gmail.com', '3187890123', 'cliente'),
('Jorge Gómez', '1127890123', 'jorge.gomez@gmail.com', '3198901234', 'cliente'),
('Sara Muñoz', '1128901234', 'sara.munoz@gmail.com', '3209012345', 'cliente'),
('Camilo Sánchez', '1129012345', 'camilo.sanchez@gmail.com', '3210123456', 'cliente'),
('Daniela Pérez', '1130123456', 'daniela.perez@gmail.com', '3221234567', 'cliente'),

('Felipe Álvarez', '1131234567', 'felipe.alvarez@gmail.com', '3232345678', 'cliente'),
('Ana Morales', '1132345678', 'ana.morales@gmail.com', '3243456789', 'cliente'),
('Kevin Hernández', '1133456789', 'kevin.hernandez@gmail.com', '3254567890', 'cliente'),
('María Angulo', '1134567890', 'maria.angulo@gmail.com', '3265678901', 'cliente'),
('Andrés Patiño', '1135678901', 'andres.patino@gmail.com', '3276789012', 'cliente'),
('Tatiana Cabrera', '1136789012', 'tatiana.cabrera@gmail.com', '3287890123', 'cliente'),
('Cristian León', '1137890123', 'cristian.leon@gmail.com', '3298901234', 'cliente'),
('Juliana Castaño', '1138901234', 'juliana.castano@gmail.com', '3309012345', 'cliente'),
('Sebastián Orozco', '1139012345', 'sebastian.orozco@gmail.com', '3310123456', 'administrador'),
('Melissa Vargas', '1140123456', 'melissa.vargas@gmail.com', '3321234567', 'administrador');

# EQUIPOS - Primeras 10
insert into equipo (tipoEquipo, marca, modelo, estado) values
('Portátil', 'HP', 'Pavilion 15', 'disponible'),
('Cámara', 'Canon', 'EOS 250D', 'disponible'),
('Tablet', 'Samsung', 'Galaxy Tab S7', 'prestado'),
('Proyector', 'Epson', 'X05+', 'disponible'),
('Portátil', 'Dell', 'Inspiron 14', 'dañado'),
('Cámara', 'Sony', 'Alpha 6000', 'prestado'),
('Tablet', 'Apple', 'iPad Air', 'disponible'),
('Proyector', 'BenQ', 'MS550', 'disponible'),
('Portátil', 'Lenovo', 'IdeaPad 3', 'prestado'),
('Cámara', 'Nikon', 'D3500', 'disponible');

# EQUIPOS - 40 restantes
insert into equipo (tipoEquipo, marca, modelo, estado) values
('Portátil', 'Asus', 'VivoBook 16', 'disponible'),
('Portátil', 'Acer', 'Aspire 5', 'disponible'),
('Portátil', 'MSI', 'Modern 14', 'prestado'),
('Portátil', 'Apple', 'MacBook Air M2', 'disponible'),
('Portátil', 'Huawei', 'MateBook D15', 'dañado'),
('Portátil', 'Toshiba', 'Satellite C55', 'dañado'),
('Cámara', 'Fujifilm', 'X-T30', 'disponible'),
('Cámara', 'Panasonic', 'Lumix G7', 'prestado'),
('Cámara', 'Olympus', 'OM-D E-M10', 'disponible'),
('Cámara', 'GoPro', 'Hero 11', 'disponible'),
('Cámara', 'Kodak', 'PixPro AZ421', 'dañado'),
('Tablet', 'Lenovo', 'Tab M10', 'prestado'),
('Tablet', 'Amazon', 'Fire HD 10', 'disponible'),
('Tablet', 'Microsoft', 'Surface Go 3', 'disponible'),
('Tablet', 'Xiaomi', 'Pad 6', 'dañado'),
('Tablet', 'Huawei', 'MatePad 11', 'disponible'),
('Proyector', 'LG', 'PF50KA', 'disponible'),
('Proyector', 'ViewSonic', 'PA503S', 'disponible'),
('Proyector', 'Optoma', 'HD146X', 'prestado'),
('Proyector', 'Sony', 'VPL-EX575', 'disponible'),
('Proyector', 'Panasonic', 'PT-VZ580U', 'dañado'),
('Portátil', 'Gigabyte', 'G5 KF5', 'disponible'),
('Portátil', 'Samsung', 'Galaxy Book3', 'disponible'),
('Portátil', 'Chuwi', 'HeroBook Pro', 'prestado'),
('Cámara', 'Canon', 'PowerShot G7X', 'disponible'),
('Cámara', 'Sony', 'ZV-E10', 'disponible'),
('Cámara', 'Nikon', 'Z50', 'dañado'),
('Tablet', 'Realme', 'Pad X', 'prestado'),
('Tablet', 'Honor', 'Pad 8', 'disponible'),
('Tablet', 'Alcatel', '1T 10', 'dañado'),
('Proyector', 'Anker', 'Nebula Capsule II', 'disponible'),
('Proyector', 'Acer', 'H6815BD', 'prestado'),
('Proyector', 'BenQ', 'TK850i', 'disponible'),
('Proyector', 'Epson', 'EB-S41', 'disponible'),
('Portátil', 'Dell', 'XPS 13', 'disponible'),
('Portátil', 'Lenovo', 'ThinkPad E14', 'prestado'),
('Cámara', 'Leica', 'D-Lux 7', 'disponible'),
('Cámara', 'Ricoh', 'GR IIIx', 'prestado'),
('Tablet', 'Google', 'Pixel Tablet', 'disponible'),
('Proyector', 'Xiaomi', 'Mi Smart Projector 2', 'disponible');

# PRESTAMOS - Primeras 10
insert into prestamo (idEquipoFK, idUsuarioFK, fechaPrestamo, fechaLimite, fechaDevolucion, estadoPrestamo) values
(1, 1, '2025-09-22', '2025-09-29', '2025-09-28 14:30:00', 'devuelto'),
(2, 2, '2025-09-25', '2025-10-02', '2025-10-02 09:45:00', 'devuelto'),
(3, 3, '2025-10-01', '2025-10-08', null, 'activo'),
(6, 4, '2025-09-30', '2025-10-07', null, 'activo'),
(9, 5, '2025-09-28', '2025-10-05', '2025-10-05 16:10:00', 'devuelto'),
(5, 6, '2025-10-02', '2025-10-09', null, 'activo'),
(4, 7, '2025-09-27', '2025-10-03', '2025-10-02 10:00:00', 'devuelto'),
(8, 8, '2025-09-29', '2025-10-06', null, 'vencido'),
(7, 9, '2025-10-03', '2025-10-10', null, 'activo'),
(10, 10, '2025-09-20', '2025-09-27', '2025-09-27 11:25:00', 'devuelto');

# PRESTAMOS - 40 restantes
insert into prestamo (idEquipoFK, idUsuarioFK, fechaPrestamo, fechaLimite, fechaDevolucion, estadoPrestamo) values
(11, 11, '2025-09-23', '2025-09-30', '2025-09-29 13:40:00', 'devuelto'),
(12, 12, '2025-09-25', '2025-10-02', null, 'activo'),
(13, 13, '2025-09-26', '2025-10-03', '2025-10-02 17:20:00', 'devuelto'),
(14, 14, '2025-09-27', '2025-10-04', null, 'vencido'),
(15, 15, '2025-09-28', '2025-10-05', null, 'activo'),
(16, 16, '2025-09-29', '2025-10-06', '2025-10-05 09:15:00', 'devuelto'),
(17, 17, '2025-09-30', '2025-10-07', null, 'activo'),
(18, 18, '2025-10-01', '2025-10-08', '2025-10-08 15:40:00', 'devuelto'),
(19, 19, '2025-10-02', '2025-10-09', null, 'activo'),
(20, 20, '2025-10-03', '2025-10-10', null, 'vencido'),
(21, 21, '2025-09-22', '2025-09-29', '2025-09-29 10:55:00', 'devuelto'),
(22, 22, '2025-09-23', '2025-09-30', null, 'activo'),
(23, 23, '2025-09-24', '2025-10-01', null, 'vencido'),
(24, 24, '2025-09-25', '2025-10-02', '2025-10-02 12:00:00', 'devuelto'),
(25, 25, '2025-09-26', '2025-10-03', null, 'activo'),
(26, 26, '2025-09-27', '2025-10-04', '2025-10-03 09:45:00', 'devuelto'),
(27, 27, '2025-09-28', '2025-10-05', null, 'activo'),
(28, 28, '2025-09-29', '2025-10-06', '2025-10-06 08:25:00', 'devuelto'),
(29, 29, '2025-09-30', '2025-10-07', null, 'vencido'),
(30, 30, '2025-10-01', '2025-10-08', null, 'activo'),
(31, 31, '2025-10-02', '2025-10-09', '2025-10-09 14:10:00', 'devuelto'),
(32, 32, '2025-10-03', '2025-10-10', null, 'activo'),
(33, 33, '2025-09-22', '2025-09-29', '2025-09-28 11:30:00', 'devuelto'),
(34, 34, '2025-09-23', '2025-09-30', null, 'vencido'),
(35, 35, '2025-09-24', '2025-10-01', '2025-09-30 15:55:00', 'devuelto'),
(36, 36, '2025-09-25', '2025-10-02', null, 'activo'),
(37, 37, '2025-09-26', '2025-10-03', null, 'activo'),
(38, 38, '2025-09-27', '2025-10-04', '2025-10-03 09:05:00', 'devuelto'),
(39, 39, '2025-09-28', '2025-10-05', null, 'vencido'),
(40, 40, '2025-09-29', '2025-10-06', null, 'activo'),
(41, 41, '2025-09-30', '2025-10-07', '2025-10-06 18:20:00', 'devuelto'),
(42, 42, '2025-10-01', '2025-10-08', null, 'activo'),
(43, 43, '2025-10-02', '2025-10-09', null, 'vencido'),
(44, 44, '2025-10-03', '2025-10-10', '2025-10-09 13:00:00', 'devuelto'),
(45, 45, '2025-09-24', '2025-10-01', null, 'activo'),
(46, 46, '2025-09-25', '2025-10-02', '2025-10-02 10:40:00', 'devuelto'),
(47, 47, '2025-09-26', '2025-10-03', null, 'vencido'),
(48, 48, '2025-09-27', '2025-10-04', '2025-10-03 17:10:00', 'devuelto'),
(49, 49, '2025-09-28', '2025-10-05', null, 'activo'),
(50, 50, '2025-09-29', '2025-10-06', '2025-10-06 08:55:00', 'devuelto');

# PRESTAMOS - Inserciones extra para aplicar funciones más adelante
insert into prestamo (idEquipoFK, idUsuarioFK, fechaPrestamo, fechaLimite, fechaDevolucion, estadoPrestamo) values
(1, 3, '2025-10-10', '2025-10-17', null, 'activo'),
(4, 5, '2025-10-09', '2025-10-16', '2025-10-16 10:25:00', 'devuelto'),
(7, 9, '2025-10-11', '2025-10-18', null, 'activo'),
(10, 10, '2025-10-08', '2025-10-15', '2025-10-15 14:00:00', 'devuelto'),
(11, 11, '2025-10-10', '2025-10-17', null, 'activo'),
(13, 13, '2025-10-12', '2025-10-19', '2025-10-19 09:30:00', 'devuelto'),
(16, 14, '2025-10-09', '2025-10-16', null, 'activo'),
(18, 17, '2025-10-10', '2025-10-17', '2025-10-17 16:10:00', 'devuelto'),
(21, 19, '2025-10-11', '2025-10-18', null, 'activo'),
(24, 20, '2025-10-10', '2025-10-17', '2025-10-17 11:55:00', 'devuelto'),
(26, 22, '2025-10-09', '2025-10-16', null, 'activo'),
(28, 24, '2025-10-12', '2025-10-19', '2025-10-18 08:40:00', 'devuelto'),
(31, 25, '2025-10-11', '2025-10-18', null, 'activo'),
(33, 27, '2025-10-10', '2025-10-17', '2025-10-17 12:30:00', 'devuelto'),
(35, 29, '2025-10-09', '2025-10-16', null, 'activo'),
(38, 30, '2025-10-08', '2025-10-15', '2025-10-15 09:10:00', 'devuelto'),
(41, 31, '2025-10-11', '2025-10-18', null, 'activo'),
(44, 33, '2025-10-12', '2025-10-19', '2025-10-19 17:45:00', 'devuelto'),
(46, 34, '2025-10-09', '2025-10-16', null, 'activo'),
(48, 35, '2025-10-10', '2025-10-17', '2025-10-17 15:50:00', 'devuelto'),
(2, 4, '2025-10-13', '2025-10-20', null, 'activo'),
(5, 6, '2025-10-14', '2025-10-21', '2025-10-21 08:35:00', 'devuelto'),
(8, 8, '2025-10-12', '2025-10-19', null, 'activo'),
(12, 12, '2025-10-15', '2025-10-22', null, 'activo'),
(15, 15, '2025-10-14', '2025-10-21', '2025-10-21 09:05:00', 'devuelto'),
(17, 18, '2025-10-13', '2025-10-20', null, 'activo'),
(19, 21, '2025-10-14', '2025-10-21', null, 'activo'),
(23, 23, '2025-10-13', '2025-10-20', '2025-10-20 10:25:00', 'devuelto'),
(25, 26, '2025-10-15', '2025-10-22', null, 'activo'),
(27, 28, '2025-10-14', '2025-10-21', '2025-10-21 13:50:00', 'devuelto');


/* ------------------- Consultas Básicas ------------------- */

select * from usuario;
select * from equipo;
select * from prestamo;

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

# 4. Listar los equipos dañados
select * from equipo where estado = 'dañado';

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
select idPrestamo, fechaPrestamo, fechaDevolucion from prestamo where estadoPrestamo = 'vencido';

# 4. Mostrar los préstamos realizados por el usuario con idUsuarioFK = 3
select * from prestamo where idUsuarioFK = 3;

# 5. Mostrar los préstamos del mes de septiembre de 2025
select * from prestamo where month(fechaPrestamo) = 9 and year(fechaPrestamo) = 2025;

# 6. Mostrar los préstamos junto al estado del equipo (usando join)
select p.idPrestamo, e.tipoEquipo, e.marca, p.estadoPrestamo
from prestamo p
join equipo e on p.idEquipoFK = e.idEquipo;

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
set estado = 'dañado'
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
delete from prestamo
where idPrestamo = 10;


/* ------------------- Requisitos Funcionales ------------------- */
# RQF001 - Registrar equipo
insert into equipo (tipoEquipo, marca, modelo, estado)
values ('portátil', 'acer', 'aspire 5', 'disponible');

# RQF002 - Modificar equipo
update equipo
set marca = 'hp', modelo = 'pavilion x360'
where idEquipo = 1;

# RQF003 - Eliminar equipo
delete from equipo
where idEquipo = 5;

# RQF004 - Consultar lista de equipos
select * from equipo;

# RQF005 - Consultar lista de equipos disponibles
select * from equipo
where estado = 'disponible';

# RQF006 - Consultar disponibilidad de equipo
select idEquipo, tipoEquipo, marca, modelo, estado
from equipo
where idEquipo = 3 or tipoEquipo like '%portátil%';

# RQF007 - Registrar cliente
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

# RQF011 - Préstamos usuario
select * 
from prestamo
where idUsuarioFK = 3;

# RQF012 - Registrar préstamo – Alto nivel
insert into prestamo (idEquipoFK, idUsuarioFK, fechaPrestamo, fechaDevolucion, estadoPrestamo)
values (1, 1, '2025-10-01', '2025-10-08', 'activo');

# RQF013 - Préstamo devuelto – Alto nivel
update prestamo
set estadoPrestamo = 'devuelto'
where idPrestamo = 5;

# RQF014 - Equipo prestado
DELIMITER $$
create trigger actualizarEquipoPrestado
after insert 
on prestamo
for each row
begin
	update equipo set estado = 'no disponible'
	where idEquipo = new.idEquipoFK;
end $$ 
DELIMITER ;

# RQF015 - Equipo no disponible
DELIMITER $$
create trigger verificarDisponibilidadEquipo
before insert 
on prestamo
for each row
begin
    declare disp varchar(20);

    select disponibilidad into disp
    from equipo
    where idEquipo = new.idEquipo;

    if disp != 'disponible' then
		signal sqlstate '45000'
		set message_text = 'no se puede realizar el préstamo, el equipo no está disponible';
	end if;
end $$
DELIMITER ;

# RQF016 - Equipo devuelto
DELIMITER $$
create trigger actualizarEquipoDisponible
after update 
on prestamo
for each row
begin
    if new.estadoPrestamo = 'devuelto' then
        update equipo
        set estado = 'disponible'
        where idEquipo = new.idEquipoFK;
    end if;
end $$
DELIMITER ;

# RQF017 - Fecha devolución  
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

# RQF018 - Extensión devolución  
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
inner join equipo e on p.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'activo';

# RQF020 - Consultar préstamo
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
inner join equipo e on p.idEquipoFK = e.idEquipo
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
inner join equipo e on p.idEquipoFK = e.idEquipo
inner join usuario u on p.idUsuarioFK = u.idUsuario
where e.idEquipo = 2;

# RQF022 - Consultar préstamo por usuario
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
inner join equipo e on p.idEquipoFK = e.idEquipo
where u.idUsuario = 4;

# RQF023 - Equipo más prestado – Alto nivel
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(p.idPrestamo) as 'Cantidad de Préstamos'
from prestamo p
inner join equipo e on p.idEquipoFK = e.idEquipo
group by e.idEquipo, e.tipoEquipo, e.marca, e.modelo
order by count(p.idPrestamo) desc
limit 1; 
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
inner join equipo e on p.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'activo';

# RQF025 - Consulta equipos por cantidad de solicitudes
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(p.idPrestamo) as 'Cantidad de Préstamos'
from equipo e
left join prestamo p on e.idEquipo = p.idEquipoFK
group by e.idEquipo, e.tipoEquipo, e.marca, e.modelo
order by count(p.idPrestamo) desc;

# RQF026 - Detección de préstamos vencidos – Alto nivel
select 
    p.idPrestamo as 'ID Préstamo',
    u.nombre as 'Nombre del Cliente',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    p.fechaPrestamo as 'Fecha Préstamo',
    p.fechaLimite as 'Fecha Límite',
    p.fechaDevolucion as 'Fecha Devolución',
    p.estadoPrestamo as 'Estado Préstamo'
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equipo e on p.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'vencido'
   or (p.estadoPrestamo = 'activo' and p.fechaLimite < curdate());

# RQF027 - Equipos más prestados del mes  
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(p.idPrestamo) as 'Cantidad de préstamos'
from prestamo p
inner join equipo e on p.idEquipoFK = e.idEquipo
where month(p.fechaPrestamo) = month(curdate())
and year(p.fechaPrestamo) = year(curdate())
group by e.idEquipo, e.tipoEquipo, e.marca, e.modelo
order by count(p.idPrestamo) desc;

# RQF028 - Consulta disponibilidad y préstamos  
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    e.estado as 'Estado actual',
    count(p.idPrestamo) as 'Total de préstamos realizados'
from equipo e
left join prestamo p on e.idEquipo = p.idEquipoFK
where e.estado = 'disponible'
group by e.idEquipo, e.tipoEquipo, e.marca, e.modelo, e.estado
order by count(p.idPrestamo) desc;

# RQF029 - Consulta préstamos por tipo de equipo  
select 
    e.tipoEquipo as 'Tipo de equipo',
    count(p.idPrestamo) as 'Cantidad de préstamos realizados'
from equipo e
inner join prestamo p on e.idEquipo = p.idEquipoFK
group by e.tipoEquipo
order by count(p.idPrestamo) desc;

# RQF030 - Cliente con préstamos activos  
select 
    u.idUsuario as 'ID Usuario',
    u.nombre as 'Nombre de Usuario',
    count(p.idPrestamo) as 'Cantidad de préstamos activos'
from usuario u
inner join prestamo p on u.idUsuario = p.idUsuarioFK
where p.estadoPrestamo = 'activo'
group by u.idUsuario, u.nombre
order by count(p.idPrestamo) desc;

# RQF031 - Procedimiento de registro de préstamo  
DELIMITER $$
create procedure registrarPrestamo(
    in p_idUsuario int,
    in p_idEquipo int,
    in p_fechaPrestamo date,
    in p_fechaDevolucion date
)
begin
    insert into prestamo(idUsuario, idEquipo, fechaPrestamo, fechaDevolucion, estado)
    values(p_idUsuario, p_idEquipo, p_fechaPrestamo, p_fechaDevolucion, 'activo');
end $$
DELIMITER ;

# RQF032 - Procedimiento registro de devolución  
DELIMITER $$
create procedure registrarDevolucion (
    in p_idPrestamo int,
    in p_fechaDevolucion datetime
)
begin
    declare v_idEquipo int;

    # Obtener el id del equipo asociado al préstamo
    select idEquipoFK into v_idEquipo
    from prestamo
    where idPrestamo = p_idPrestamo;

    # Actualizar la fecha de devolución y el estado del préstamo
    update prestamo
    set fechaDevolucion = p_fechaDevolucion,
        estadoPrestamo = 'devuelto'
    where idPrestamo = p_idPrestamo;

    # Cambiar el estado del equipo a 'disponible'
    update equipo
    set estado = 'disponible'
    where idEquipo = v_idEquipo;
end $$
DELIMITER ;

# RQF033 - Procedimiento préstamos vencidos  
DELIMITER $$
create procedure actualizarPrestamosVencidos ()
begin
    # Actualiza todos los préstamos activos cuya fecha límite ya pasó
    update prestamo
    set estadoPrestamo = 'vencido'
    where estadoPrestamo = 'activo'
      and fechaLimite < curdate();
end $$
DELIMITER ;

# RQF034 - Procedimiento préstamos por usuario  
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
inner join equipo e on p.idEquipoFK = e.idEquipo
where p.estadoPrestamo = 'activo';

# RQF037 - Vista de historial por cliente  
create view vistaHistorialCliente as
select 
    u.idUsuario as idUsuario,
    u.nombre as nombreUsuario,
    p.idPrestamo as idPrestamo,
    e.idEquipo as idEquipo,
    e.tipoEquipo as tipoEquipo,
    e.marca as marca,
    e.modelo as modelo,
    p.fechaPrestamo as fechaPrestamo,
    p.fechaLimite as fechaLimite,
    p.fechaDevolucion as fechaDevolucion,
    p.estadoPrestamo as estadoPrestamo
from prestamo p
inner join usuario u on p.idUsuarioFK = u.idUsuario
inner join equipo e on p.idEquipoFK = e.idEquipo
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

select * from vistaInventario;

# RQF039 - Vista equipos más usados  
create view vistaEquiposMasUsados as
select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de equipo',
    e.marca as 'Marca',
    e.modelo as 'Modelo',
    count(p.idPrestamo) as 'Cantidad de Préstamos'
from equipo e
inner join prestamo p on e.idEquipo = p.idEquipoFK
where month(p.fechaPrestamo) = month(curdate())
  and year(p.fechaPrestamo) = year(curdate())
group by e.idEquipo, e.tipoEquipo, e.marca, e.modelo
order by count(p.idPrestamo) desc;

# RQF040 - Restricción eliminación equipos  
DELIMITER $$
create trigger beforeDeleteEquipo
before delete
on equipo
for each row
begin
    declare prestamosActivos int;

    select count(*) into prestamosActivos
    from prestamo
    where idEquipo = old.idEquipo and estado = 'activo';

    if prestamosActivos > 0 then
        signal sqlstate '45000'
        set message_text = 'No se puede eliminar el equipo porque tiene préstamos activos.';
    end if;
end $$ 
DELIMITER ;

