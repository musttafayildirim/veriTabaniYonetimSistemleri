create database Kitap_Kira;

use Kitap_Kira;

create table Musteriler(
MusteriNo int primary key identity(1,1),
MusteriAdi varchar(100),
MusteriSoyadi varchar(100),
MusteriAdresi varchar(250),
MusteriIl varchar(100),
MusteriTelefon varchar(15),
UyelikTarihi date
);

create table Kategoriler(
KategoriNo int primary key identity(1,1),
Aciklamalar varchar(250)
);

create table Kiralar(
FaturaNo int primary key identity(1,1),
MusteriNo int references Musteriler(MusteriNo),
KiralamaTarihi date,
TeslimTarihi date
);

create table Kitaplar(
KitapNo int primary key identity(1,1),
KitapAdi varchar(100),
KategoriNo int references Kategoriler(KategoriNo),
Raiting int,
KiralamaFiyatı money,
Kiradamı binary
);

create table KiraDetaylari(
ID int primary key identity(1,1),
FaturaNo int references Kiralar(FaturaNo),
KitapNo int references Kitaplar(KitapNo)
);
