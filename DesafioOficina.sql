show databases;
-- drop database oficina;
create database oficina;
use oficina; 
-- Criar tabela Cliente
create table clients(
					idClient int auto_increment primary key,
                    Compname varchar(30),
                    CPF char(11),
                    CNPJ char(15),
                    Contact varchar(30),
                    Address varchar(150)
 					);

-- Criar tabela Veiculo
create table vehicle(
					idVehicle int auto_increment primary key,
                    idClientVehicle int,
                    Placa varchar(10) unique,
                    constraint fk_vehicle_client foreign key (idClientVehicle) references	clients(idClient)
 					);
create table team(
	idTeam int auto_increment primary key, 
	ativity varchar(45)
);

-- Criar tabela Técnico
create table technician(
					idTechnician int auto_increment primary key,
                    idTeam int,
					Fname varchar(10),
					Lname varchar(20),
                    registration int unique,
                    constraint fk_team foreign key (idTeam) references	team(idTeam)
 					);

-- Criar tabela Pagamento
create table payment(
	idPayment int auto_increment primary key, 
	Ptype enum('CC', 'D', 'PIX') default 'CC',
    Pvalue float not null,
    PStatus bool default False
);


-- Criar tabela Serviço
create table service(
	idService int auto_increment primary key,
    idServVehicle int,
    idServPayment int,
    idServTeam int,
	date_ini date,
    date_fim date default null,
    constraint fk_vehicle_serv foreign key (idServVehicle) references	vehicle(idVehicle),
    constraint fk_payment_serv foreign key (idServPayment) references	payment(idPayment),
    constraint fk_team_serv foreign key (idServTeam) references	team(idTeam)
);

-- Criar tabela Material
create table material(
					idMaterial int auto_increment primary key,
					Mname varchar(45),
					Mdescription varchar(20),
                    Mvalue float,
                    idMservice int,
                    constraint fk_service_material foreign key (idMservice) references	service(idService)
 					);