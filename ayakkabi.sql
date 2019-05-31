create database ayakkabi
use ayakkabi

create table Ayakkabý( 
 Ayakkabý_ID int primary key identity(1,1),
 AyakkabýAdý varchar(20),
 Model_ID int Foreign Key References Model(Model_ID),
 Stok_ID int Foreign Key References Stok(Stok_ID),
 Fiyat int,
 )
 
 create table Özellikleri(
 Ayakkabý_ID int Foreign Key References Ayakkabý(Ayakkabý_ID),
 AyakkabýNumarasý int,
 Renk_ID int Foreign Key References Renk(Renk_ID),
 Deri_Hammeddesi varchar(20),
 Taban_Hammaddesi varchar(20),
 )

 create table Siparis(
 Siparis_ID int primary key identity(1,1),
 Personel_ID int Foreign Key References Personel(Personel_ID),
 Musteri_ID int Foreign Key References Musteri(Musteri_ID),
 Ayakkabý_ID int Foreign Key References Ayakkabý(Ayakkabý_ID),
 Miktarý int,
 Kargo_ID int Foreign Key References Kargo(Kargo_ID),
 Tarih datetime,
 )

 create Table Renk(
 Renk_ID int primary key identity(1,1),
 RenkAdý varchar(15),
 )

 create Table Personel(
 Personel_ID int primary key identity(1,1),
 PersonelAdý varchar(30),
 PersonelSoyadý varchar(30),
 PersonelTC int,
 PersonelCinsiyet varchar(5),
 PersonelTelefon int,
)

create Table Musteri(
 Musteri_ID int primary key identity(1,1),
 MusteriAdý varchar(30),
 MusteriSoyadý varchar(30),
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
MarkaADý varchar(15),
)

create Table Model(
Model_ID int primary key identity(1,1),
Marka_ID int foreign key References Marka(Marka_ID),
ModelAdý varchar(15),
)

create table ÜrünYorum(
Ayakkabý_ID int foreign key References Ayakkabý(Ayakkabý_ID),
Yorum varchar(150),
)

create table Stok(
Stok_ID int primary key identity(1,1),
StokAdedi int,
StokDurumu varchar(10),
)


select * from Renk
insert into Renk values ('yeþil')
select * from Ayakkabý
insert into Renk values ('Nike Mercuriel')
select * from Model
insert into Model(ModelAdý) values ('Bot')
select * from Marka
insert into Marka values ('Derimod')
select* from Siparis
insert into Siparis(Miktarý,Tarih) values (36,2013.12)
select * from Özellikleri
insert into Özellikleri(AyakkabýNumarasý,Deri_Hammeddesi,Taban_Hammaddesi) values(42,'kauçuk','plastik')
select * from Kargo
insert into Kargo(KargoSirketi) values ('Aras')
select* from Stok
insert into Stok(StokAdedi,StokDurumu) values (2,'Var')


