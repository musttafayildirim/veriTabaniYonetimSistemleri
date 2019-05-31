
create database OKUL

use OKUL

create table Bolum(
BNo int identity(1,1) primary key,
BAdi varchar(50)
);

create table Ders(
DNo int primary key identity(1,1),
DAdi varchar(50),
BNo int foreign key references Bolum(BNo)
);

create table Ogrenci(
ONo bigint primary key,
Adi varchar(50),
soyadi varchar(50),
BNo int foreign key references Bolum(BNo)
);

create table Puan(
ONo bigint foreign key references Ogrenci(ONo),
BNo int foreign key references Bolum(BNo),
Vize int,
Final int
);
