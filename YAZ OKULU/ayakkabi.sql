create database ayakkabi
use ayakkabi

create table Ayakkab�( 
 Ayakkab�_ID int primary key identity(1,1),
 Ayakkab�Ad� varchar(20),
 Model_ID int Foreign Key References Model(Model_ID),
 Stok_ID int Foreign Key References Stok(Stok_ID),
 Fiyat int,
 )
 
 create table �zellikleri(
 Ayakkab�_ID int Foreign Key References Ayakkab�(Ayakkab�_ID),
 Ayakkab�Numaras� int,
 Renk_ID int Foreign Key References Renk(Renk_ID),
 Deri_Hammeddesi varchar(20),
 Taban_Hammaddesi varchar(20),
 )

 create table Siparis(
 Siparis_ID int primary key identity(1,1),
 Personel_ID int Foreign Key References Personel(Personel_ID),
 Musteri_ID int Foreign Key References Musteri(Musteri_ID),
 Ayakkab�_ID int Foreign Key References Ayakkab�(Ayakkab�_ID),
 Miktar� int,
 Kargo_ID int Foreign Key References Kargo(Kargo_ID),
 Tarih datetime,
 )

 create Table Renk(
 Renk_ID int primary key identity(1,1),
 RenkAd� varchar(15),
 )

 create Table Personel(
 Personel_ID int primary key identity(1,1),
 PersonelAd� varchar(30),
 PersonelSoyad� varchar(30),
 PersonelTC int,
 PersonelCinsiyet varchar(5),
 PersonelTelefon int,
)

create Table Musteri(
 Musteri_ID int primary key identity(1,1),
 MusteriAd� varchar(30),
 MusteriSoyad� varchar(30),
 MusteriTC int,
 MusteriCinsiyet varchar(5),
 MusteriTelefon int,
 MusteriIl varchar(15),
 MusteriIlce varchar(15),
 MusteriAdres varchar(50),
)

create Table Kargo(
Kargo_ID int primary key identity(1,1),
KargoSirketi varchar(15),
)

create Table Marka(
Marka_ID int primary key identity(1,1),
MarkaAD� varchar(15),
)

create Table Model(
Model_ID int primary key identity(1,1),
Marka_ID int foreign key References Marka(Marka_ID),
ModelAd� varchar(15),
)

create table �r�nYorum(
Ayakkab�_ID int foreign key References Ayakkab�(Ayakkab�_ID),
Yorum varchar(150),
)

create table Stok(
Stok_ID int primary key identity(1,1),
StokAdedi int,
StokDurumu varchar(10),
)


select * from Renk
insert into Renk values ('ye�il')
select * from Ayakkab�
insert into Renk values ('Nike Mercuriel')
select * from Model
insert into Model(ModelAd�) values ('Bot')
select * from Marka
insert into Marka values ('Derimod')
select* from Siparis
insert into Siparis(Miktar�,Tarih) values (36,2013.12)
select * from �zellikleri
insert into �zellikleri(Ayakkab�Numaras�,Deri_Hammeddesi,Taban_Hammaddesi) values(42,'kau�uk','plastik')
select * from Kargo
insert into Kargo(KargoSirketi) values ('Aras')
select* from Stok
insert into Stok(StokAdedi,StokDurumu) values (2,'Var')


