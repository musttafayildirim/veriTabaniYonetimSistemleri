create database Yarisma
use yarisma


create table Il(
Plaka_No int primary key,
Il_Adi varchar(50)
)

create table Uye(
Uye_No int primary key identity(1,1),
Uye_Adi varchar(50),
Uye_Soyadi varchar(50),
Uye_Tarih datetime,
Plaka_No int foreign key references Il(Plaka_No),
Sifre varchar(11),
Giris_Sayisi int,
Uye_Puan int,
)

create table istatistik(
Uye_No int foreign key references Uye(Uye_No),
Istatistik_Tarihi datetime,
Toplam_Puan int
)


Create table Soru_Tur(
Soru_Tur_No int primary key,
Soru_Tür_Adi varchar(20),
)
create table Soru(
Soru_No int primary key identity(1,1),
Soru_Baslýk varchar(100),
Secenek1 varchar(20),
Secenek2 varchar(20),
Secenek3 varchar(20),
Secenek4 varchar(20),
Dogru_Cevap varchar(20),
Soru_Tur_No int foreign key references Soru_Tur(Soru_Tur_No),
Soru_Puan int,
Uye_No int foreign key references Uye(Uye_No)
)

