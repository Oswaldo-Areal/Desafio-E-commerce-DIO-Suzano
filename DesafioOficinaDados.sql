use oficina;

insert into clients(Compname, CPF, CNPJ, Contact, Address)
			values('Cliente 1', '12345678900', null,'123456789', 'Rua do Cliente 1'),
            ('Cliente 2',  null,'123456789001124','903456789', 'Rua do Cliente 2'),
            ('Cliente 3',  null,'123456789001135','903456789', 'Rua do Cliente 3');
            
insert into vehicle(idClientVehicle, Placa)
			values('1','AB1234'),
            ('2','AC1234'),
            ('3','CB1234'),
            ('1','AD1234');

insert into team(ativity)
	values('Mecânica'),
    ('Pintura'),
    ('Elétrica');
            
insert into technician(Fname, Lname, registration,idTeam)
			values('Jose', 'Silva', 12345, 1),
            ('Mario', 'Silva', 22345, 2),
            ('Pedro', 'Silva', 32345, 3);
            
-- enum('CC', 'D', 'PIX') default 'CC'            
insert into payment(Ptype , Pvalue, Pstatus)
			values('CC', 500, false),
            ('D', 2500, false),
            ('PIX', 500, false),
            ('PIX', 750, false);
            
insert into service(idServVehicle, idServPayment, idServTeam, date_ini, date_fim)
			values	(1, 2, 3, '2024-11-13', null),
				(2, 1, 3, '2024-11-13', null),
                (3, 3, 1, '2024-11-13', null),
                (4, 4, 2, '2024-11-13', null);
                
insert into material(Mname, Mdescription, Mvalue, idMservice)
					values('M1', 'Material 1', 100, 1),
                    ('M2', 'Material 2', 50, 1),
                    ('M3', 'Material 3', 150, 2),
                    ('M4', 'Material 4', 200, 3),
                    ('M5', 'Material 5', 130, 3),
                    ('M6', 'Material 6', 300, 4);
