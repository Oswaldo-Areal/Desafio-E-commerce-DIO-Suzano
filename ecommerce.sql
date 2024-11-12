-- criação BD para E-commerce --
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_cliente unique (CPF)
);

-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(100) not null,
    Classification_kids bool default false,
    Category enum('Eletronico', 'Vestuario', 'Brinquedos', 'Livros') not null,
    Avaliacao float default 0,
    Size varchar(10)
);
create table payments(
	idClient int , 
    idPayment int,
    typePayment enum('Boleto', 'Cartao', 'Dois Cartoes' ),
    limitAvailable float,
    primary key(idClient, idpayment)
 );

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int not null,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription  varchar(255),
	freight float default 10,
    paymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrderClient) references	clients(idClient)
		on update cascade
 );

 -- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation  varchar(255),
    quantity int default 0
 );
 
 -- criar tabela fornecedor
 create table supplier(
	idSupplier int auto_increment primary key,
    SocialName  varchar(255) not null,
    CNPJ char(15) not null ,
    Contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
 );

 -- criar tabela vendedor	
 create table seller(
	idSELLER int auto_increment primary key,
    SocialName  varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    Contact char(11) not null,
    constraint unique_cnpj_supplier unique (CNPJ),
    constraint unique_cpf_supplier unique (CPF)
 );
 
  -- criar tabela produto vendedor
  create table productSeller(
  idPseller int ,
  idPproduct int,
  prodQuantity int default 1,
  primary key (idPseller, idPproduct),
  constraint fk_product_seller foreign key (idPseller) references seller (idSeller),
  constraint fk_product_product foreign key (idPproduct) references product (idProduct)
  );
  -- desc productSeller;
  
  create table productOrder(
  idPOproduct int,
  idPOorder int,
  poQuantity int,
  poStatus enum('Disponivel','Indisponivel') default 'Disponivel',
  primary key (idPOproduct, idPOorder),
  constraint fk_productorder_seller foreign key (idPOproduct) references product (idProduct),
  constraint fk_productorder_product foreign key (idPOorder) references orders (idOrder)
  );
 
create table storageLocation(
  idLproduct int,
  idLstorage int,
  location varchar(255) not null,
  primary key (idLproduct, idLstorage),
  constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
  constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idProdStorage)
  );
 
 create table productSupplier(
 idpsSupplier int,
 idpsProduct int, 
 quantity int not null,
 primary key (idpsSupplier, idpsProduct),
 constraint fk_product_supplier_supplier foreign key (idpsSupplier) references supplier (idSupplier),
 constraint fk_storage_supplier_storage foreign key (idpsProduct) references product (idProduct) 
 );
 
 insert into clients(Fname, Minit, Lname, CPF, Address) 
					values ('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - SP'),
							 ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - SP'),
							 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - RJ'),
							 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - SP'),
							 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - SP'),
							 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - SP');

insert into product(Pname, Classification_kids, Category, Avaliacao, Size) 
						values ('Fone de ouvido',false,'Eletronico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestuario','5',null),
                              ('Microfone Vedo',False,'Eletronico','4',null),
                              ('Sofá retrátil',False,'Brinquedos','3','3x57x80'),
                              ('O Principe',False,'Livros','2',null),
                              ('Fire Stick',False,'Eletrônico','3',null);

insert into orders (idOrderClient, orderStatus, orderDescription, freight, paymentCash)
					values (1, default,'compra via aplicativo',null, 1),
						 (2,default,'compra via aplicativo',50, 0),
						 (3,'Confirmado',null,null, 1),
						 (4,default,'compra via web site',150, 0);

insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) 
					values(8,5,2,null), 
						(9,6,1,null), 
						(10,7,1,null);
                        
insert into productStorage (StorageLocation,Quantity) 
							values ('Rio de Janeiro',1000),
									('Rio de Janeiro',500),
									('São Paulo',10),
									('São Paulo',100),
									('São Paulo',10),
									('Brasília',60);
								
insert into storageLocation (idLproduct, idLstorage, location) 
						values(8,2,'RJ'),
							(9,6,'GO');
                            
insert into supplier (SocialName, CNPJ, contact) 
						values ('Almeida e filhos', 123456789123456,'21985474'),
								('Eletrônicos Silva',854519649143457,'21985484'),
								('Eletrônicos Valma', 934567893934695,'21975474');
insert into supplier (SocialName, CNPJ, contact)  values
								('Kids World',456789123654485,1198657484);

insert into productSupplier(idPsSupplier, idPsProduct, quantity)
							values (1, 8, 500),
                            (1,9,400),
                            (2, 10, 633),
                            (3, 11, 5),
                            (2, 12, 10);
                            
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);
                        
insert into productSeller (idPseller, idPproduct, prodQuantity) 
						values  (1,8,80),
								(2,9,10);
                                
select count(*)  from  clients c,  orders o  
	where c.idClient = o.idOrderClient
    group by idOrder;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select * from clients left outer join  orders on idClient = idOrderClient;

select c.idClient, Fname, count(*) as Quanty_Orders from clients c inner join  orders o on c.idClient = o.idOrderClient
				group by c.idClient;

select sl.SocialName from seller sl inner join  supplier sp on sl.CNPJ = sp.CNPJ;    

show tables;
desc supplier;
select  p.Pname, sp.SocialName from product p join productsupplier ps join supplier sp where 
		p.idProduct = ps.idpsProduct and sp.idSupplier = ps.idpsSupplier;

              