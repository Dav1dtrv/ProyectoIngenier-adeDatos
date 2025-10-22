#preguntas sustentacion Sebastian Mora

# RQF14 como procedimiento
  
DELIMITER $$
create procedure actualizarEquipPrestado(
    in p_idEquipo int)
    
begin
    
	update equipo set estado = 'prestado'
    where idEquipo = p_idEquipo;
end $$
DELIMITER ;
call actualizarEquipPrestado(3);






# RQF20 como vista
  
create view ConsultaPrestamo as 

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






# RQF18 como una funcion
  
DELIMITER $$

create function extenderfechalimite(
	p_idPrestamo int, fechaNueva date)
    
returns varchar(100) 

begin 
	update prestamo set fechaDevolucion = fechaNueva
    where idPrestamo = p_idPrestamo;
    
    return concat('La nueva fecha límite del préstamo ', idPrestamo, ' es ', fechaNueva);
end $$
DELIMITER ;
    

