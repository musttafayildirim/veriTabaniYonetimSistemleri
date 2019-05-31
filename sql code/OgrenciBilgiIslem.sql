create database OgrenciBilgiIslem;

use OgrenciBilgiIslem;

create table Bolum(
BolumNo int primary key identity(1,1),
BolumAdi varchar(50)
);

create table  Ogrenci(
TC bigint primary key,
Adi varchar(50),
Soyadi varchar(50),
BolumNo int references Bolum(BolumNo)
);

create table Dersler(
DersNo int primary key identity(1,1),
DersAdi varchar(50),
);

create table Bilgiler(

);
