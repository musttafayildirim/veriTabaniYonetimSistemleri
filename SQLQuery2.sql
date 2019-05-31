create database YARISMA
use YARISMA
create table SoruTur(
SoruTurNo int primary key identity (1,1),
SoruTurAdi varchar (15)
)

create table Il(
IlPlakaNo int primary key,
IlAdi varchar (30)
)

create table Uye(
UyeNo int primary key identity (1,1),
UyeAdi varchar (20),
UyeSoyadi varchar (25),
IlPlakaNo int foreign key references Il(IlPlakaNo),
Sifre varchar (15),
GirisSayisi int ,
UyeSonPuan int 

) 

create table Soru (
SoruNo int primary key identity (1,1),
SoruBaslik varchar (25),
Soru1 varchar(50),
Soru2 varchar(50),
Soru3 varchar(50),
Soru4 varchar(50),
DogruCevap varchar (5),
SoruTurNo int foreign key references SoruTur(SoruTurNo),
SoruPuan int ,
UyeNo int foreign key references Uye (UyeNo)
)

create table Istatistik(
UyeNo int foreign key references Uye (UyeNo),
IstatistikTarih date,
ToplamPuan int 
)

Create table Puanlar(
UyeNo int foreign key references Uye(UyeNo),
UyePuan int ,
Tarih date
)