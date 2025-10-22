/* ------------ SUSTENTACIÓN ------------ */

# 4 mediante procedimiento - Angel
DELIMITER $$
create procedure ConsultarListaEquipos()
begin
	select 
    idEquipo as 'ID Equipo',
    tipoEquipo as 'Tipo de Equipo',
    marca as Marca,
    modelo as Modelo,
    estado as Estado
    from equipo;
    
end $$ 
DELIMITER ;

call ConsultarListaEquipos();

# 27 como procedimiento - Angel
DELIMITER $$
create procedure EquiposMasPrestados()
begin
	
    select 
    e.idEquipo as 'ID Equipo',
    e.tipoEquipo as 'Tipo de Equipo',
    e.marca as Marca,
    e.modelo as Modelo,
    e.estado as Estado,
    p.fechaPrestamo as 'Fecha Préstamo',
    count(p.idPrestamo) as 'Cantidad de Préstamos'
    from equipo e
    inner join prestamo p on e.idEquipo = p.idEquipoFK
    where month(p.fechaPrestamo) = month(curdate())
		and year(p.fechaPrestamo) = year(curdate())
    group by e.idEquipo
    order by count(p.idPrestamo), p.fechaPrestamo desc;
    
end $$
DELIMITER ;
call EquiposMasPrestados();
drop procedure EquiposMasPrestados;
