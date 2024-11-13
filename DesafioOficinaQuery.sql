

select distinct c.Compname, v.placa  from clients c, vehicle v, service s, payment p 
		where c.idClient = v.idClientVehicle and v.idClientVehicle = s.idServVehicle
        order by c.Compname;
        
select Fname, Lname from technician;

select s.idService, s.date_ini, s.date_fim, v.Placa, c.Compname, p.Pvalue from service s, vehicle v, clients c,
		payment p
		where v.idClientVehicle = s.idServVehicle and c.idClient = v.idClientVehicle
        and p.idPayment = s.idServPayment;