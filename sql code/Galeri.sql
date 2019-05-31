create database Galeri

use Galeri

create table Arac(
AracNo int primary key identity(1,1),
Model int check(Model>1900 and Model<9999),
Marka varchar(25),
Plaka varchar(10) check(Plaka>'01 AA 001' and Plaka<'81 ZZ 9999')  ,
Fiyat money
);

create table Musteri(
MusteriNo int primary key identity(1,1),
MusteriAdi varchar(100),
MusteriSoyadi varchar(100),
MusteriAdres varchar(250),
MusteriTelefon varchar(13),
);

create table Satis(
SatisNo int primary key identity(1,1),
MusteriNo int foreign key references Musteri(MusteriNo),
AracNo int foreign key references Arac(AracNo),
SatisTarihi datetime Default '01.01.1900',
SatisFiyati money Not Null
);

create table Alim(
AlimNo int primary key identity(1,1),
MusteriNo int foreign key references Musteri(MusteriNo),
AracNo int foreign key references Arac(AracNo),
AlimTarihi datetime Default '01.01.1900',
AlimFiyati money Not Null
);

insert into Musteri (MusteriAdi,MusteriSoyadi,MusteriAdres,MusteriTelefon) values ('Turgut','Özseven','Turhal/Tokat','035622222222');
insert into Musteri (MusteriAdi,MusteriSoyadi,MusteriAdres,MusteriTelefon) values ('Mustafa','Çaðlayan','Meram/Konya','051121111111');
insert into Musteri (MusteriAdi,MusteriSoyadi,MusteriAdres,MusteriTelefon) values ('Ahmet','Kara','Zile/Tokat','03563333333');
insert into Musteri (MusteriAdi,MusteriSoyadi,MusteriAdres,MusteriTelefon) values ('Murat','Beyaz','Turhal/Tokat','0356555555');
insert into Musteri (MusteriAdi,MusteriSoyadi,MusteriAdres,MusteriTelefon) values ('Elif','Kurt','Beþiktaþ/Ýstanbul','05781471414');
insert into Musteri (MusteriAdi,MusteriSoyadi,MusteriAdres,MusteriTelefon) values ('Ayþe','Uçar','Taþova/Amasya','0358666666');
insert into Musteri (MusteriAdi,MusteriSoyadi,MusteriAdres,MusteriTelefon) values ('Bülent','Ayar','Turhal/Tokat','0356888888');

insert into Arac(Model,Marka,Plaka,Fiyat) values('2004','Fiat Marea','60 TT 6060','16.000');
insert into Arac(Model,Marka,Plaka,Fiyat) values('2000','Renault Megane','60 TT 6061','14.000');
insert into Arac(Model,Marka,Plaka,Fiyat) values('2007','Ford Focus','60 TT 6062','28.000');
insert into Arac(Model,Marka,Plaka,Fiyat) values('2005','Volkswagen Golf','60 TT 6063','26.000');
insert into Arac(Model,Marka,Plaka,Fiyat) values('1998','Opel Astra','60 TT 6064','9.000');

insert into Satis(MusteriNo,AracNo,SatisTarihi,SatisFiyati) values ('1','1','05.04.2010','17000');
insert into Satis(MusteriNo,AracNo,SatisTarihi,SatisFiyati) values ('4','5','06.01.2010','11500');
insert into Satis(MusteriNo,AracNo,SatisTarihi,SatisFiyati) values ('7','4','06.10.2010','27000');
insert into Satis(MusteriNo,AracNo,SatisTarihi,SatisFiyati) values ('2','1','02.07.2010','17500');

insert into Alim(MusteriNo,AracNo,AlimTarihi,AlimFiyati) values ('3','1','08.02.2010','15000');
insert into Alim(MusteriNo,AracNo,AlimTarihi,AlimFiyati) values ('6','1','12.04.2010','15000');
insert into Alim(MusteriNo,AracNo,AlimTarihi,AlimFiyati) values ('2','5','04.15.2010','9500');
insert into Alim(MusteriNo,AracNo,AlimTarihi,AlimFiyati) values ('1','2','05.15.2010','14000');
insert into Alim(MusteriNo,AracNo,AlimTarihi,AlimFiyati) values ('5','3','08.22.2010','26000');


select Arac.Marka,Arac.Model,Arac.Fiyat from Arac where Arac.Model<2004;

select Arac.Marka,Arac.Model,Arac.Fiyat from Arac where Arac.Model>1999 and Arac.Model<2010;

select Musteri.MusteriAdi,Musteri.MusteriSoyadi from Alim,Satis,Musteri where Musteri.MusteriNo=Alim.MusteriNo and Musteri.MusteriNo=Satis.MusteriNo

select Alim.AlimTarihi,Satis.SatisTarihi from Arac,Alim,Satis where Arac.AracNo=Alim.AracNo and Arac.AracNo=Satis.AracNo AND Arac.Marka LIKE'FORD%'

select Musteri.MusteriAdi,Musteri.MusteriSoyadi,Arac.Plaka from Arac,Musteri,Alim where Arac.AracNo=Alim.AracNo and Musteri.MusteriNo=Alim.MusteriNo and (Arac.Marka LIKE'Opel%' or Arac.Marka LIKE'FORD%')

select Musteri.MusteriAdi,Musteri.MusteriSoyadi,Arac.Marka,Arac.Model from Arac,Musteri,Alim,Satis where Arac.AracNo=Alim.AracNo and Musteri.MusteriNo=Alim.MusteriNo and (Arac.Marka LIKE'Opel%' or Arac.Marka LIKE'Fiat%') and Arac.AracNo=Satis.AracNo and Musteri.MusteriNo=Satis.MusteriNo and Arac.Model>2000

select Arac.Plaka from Musteri,Arac,Alim where Musteri.MusteriNo=Alim.MusteriNo and Arac.AracNo=Alim.AracNo and Musteri.MusteriAdi='Ahmet'

select Musteri.MusteriAdi,Musteri.MusteriSoyadi,Musteri.MusteriAdres,Musteri.MusteriTelefon,Arac.Marka,Arac.Model,Arac.Plaka,Arac.Fiyat,Alim.AlimFiyati,Alim.AlimTarihi from Musteri,Arac,Alim where Musteri.MusteriNo=Alim.MusteriNo and Arac.AracNo=Alim.AracNo and Arac.Fiyat>10000

select Arac.Marka,Arac.Model,Musteri.MusteriAdi,Musteri.MusteriSoyadi from Arac,Musteri,Satis where Arac.AracNo=Satis.AracNo and Musteri.MusteriNo=Satis.MusteriNo and Satis.SatisFiyati>5000 and Satis.SatisFiyati<50000

select Musteri.MusteriAdi,Musteri.MusteriSoyadi,Arac.Marka,Arac.Model from Arac,Alim,Satis,Musteri where Arac.AracNo=Alim.AracNo and Arac.AracNo=Satis.AracNo and Musteri.MusteriNo=Alim.MusteriNo and Musteri.MusteriNo=Satis.MusteriNo and Alim.AlimFiyati>Satis.SatisFiyati

select Arac.Model,Arac.Marka,Arac.Fiyat from Arac where Arac.Model<2005

select Arac.Model,Arac.Marka,Arac.Fiyat from Arac where Arac.Model>1999 and Arac.Model<2010

select * from Musteri where Musteri.MusteriAdi LIKE '%y%' and Musteri.MusteriAdres LIKE '%turhal%'

select Arac.AracNo,Arac.Model,Arac.Plaka,Arac.Fiyat from Arac where Arac.Model>2000 and Arac.Marka LIKE '%Opel%' Or Arac.Marka LIKE '%Fiat%'

select * from Musteri order by Musteri.MusteriAdi

select * from Arac order by Arac.Model DESC, Arac.Fiyat ASC

select Arac.AracNo,Satis.SatisTarihi,Satis.SatisFiyati AS 'Satýþ Fiyatý'from Satis,Arac where Arac.AracNo=Satis.AracNo

select * from Arac where Arac.Fiyat>12000 order by Arac.Fiyat Desc

select * from Arac,Satis where Arac.AracNo=Satis.AracNo and (Satis.SatisFiyati>10000 or Satis.MusteriNo=4)

select * from Arac,Satis where Arac.AracNo=Satis.AracNo and Satis.SatisTarihi>'04.01.2010'

select * from Alim,Arac where Arac.AracNo=Alim.AracNo and Alim.AlimTarihi>'04.01.2010' and Alim.AlimTarihi<'07.01.2010' and Alim.AlimFiyati>10000 order by Alim.AlimTarihi DESC, Alim.AlimFiyati DESC

select Arac.Marka,Arac.Model,Arac.Fiyat,Musteri.MusteriNo,Musteri.MusteriAdi,Musteri.MusteriSoyadi,Musteri.MusteriAdres,Musteri.MusteriTelefon,Satis.SatisFiyati,Satis.SatisNo,Satis.SatisTarihi from Satis,Arac,Musteri where Arac.AracNo=Satis.AracNo and Musteri.MusteriNo=Satis.MusteriNo and Satis.SatisFiyati<20000 and Satis.SatisFiyati>10000 and (Musteri.MusteriNo=2 or Musteri.MusteriNo=4)

select * from Musteri,Satis where Musteri.MusteriAdres LIKE '%turhal%' and Musteri.MusteriNo=Satis.MusteriNo

select * from Musteri where Musteri.MusteriAdres LIKE '%tokat%' and Musteri.MusteriTelefon LIKE '%6%'

select Musteri.MusteriAdres,Musteri.MusteriTelefon from Musteri where Musteri.MusteriAdi LIKE 'a%'

select * from Arac where Arac.Marka LIKE '%OPEL%' or Arac.Marka LIKE '%fiat%' order by Arac.Marka ASC

select * from Arac where Arac.Model=1998 or Arac.Model=2005 or Arac.Model=2007

select ((Arac.Fiyat*20/100)+Arac.Fiyat) AS 'Faizli Arac Fiyatý',Arac.Marka from Arac

select Arac.Fiyat*15/100 ,Arac.Marka from Arac where Arac.Model>2015

select Musteri.MusteriAdi + Musteri.MusteriSoyadi AS [Musteri Ad Soyad] from Musteri Order By [Musteri Ad Soyad]

select Musteri.MusteriNo,Musteri.MusteriAdi +' '+ Musteri.MusteriSoyadi AS [AD SOYAD],Arac.AracNo, Arac.Marka, Convert(nvarchar(100),Satis.SatisFiyati)+'   '+Convert(nvarchar(100),Satis.SatisTarihi) AS [Satiþ ve Tarih] from Musteri,Arac,Satis where Musteri.MusteriNo=Satis.MusteriNo And Arac.AracNo=Satis.AracNo and (Musteri.MusteriNo IN (1,4,7) and Arac.AracNo IN (1,2,5)) order by [Satiþ ve Tarih] ASC

select Musteri.MusteriAdi+' ' +Musteri.MusteriSoyadi AS 'A.Soyad'  from Musteri

select * from Alim order by Alim.AlimFiyati DESC , MONTH(Alim.AlimTarihi) ASC

select convert(Nvarchar(1),Musteri.MusteriAdi)+' '+convert(nvarchar(5),Musteri.MusteriSoyadi) AS [A.Soyad] from Musteri where Musteri.MusteriSoyadi LIKE  '%______%' order by Musteri.MusteriAdi ASC

select LTRIM(SUBSTRING(Musteri.MusteriAdi,1,1)+' '+SUBSTRING(Musteri.MusteriSoyadi,1,5)) AS [Musteri Ad Soyad] from Musteri where LEN(Musteri.MusteriSoyadi)>5 order by Musteri.MusteriAdi ASC

select SUBSTRING(Musteri.MusteriAdres,(select CHARINDEX('/',Musteri.MusteriAdres) from Musteri),100) from Musteri

select CHARINDEX('/',Musteri.MusteriAdres) from Musteri

select substring(Musteri.MusteriAdres,1, charindex('/',Musteri.MusteriAdres)) as [ILCE],
substring(Musteri.MusteriAdres,(charindex('/',Musteri.MusteriAdres)) + 1, len(Musteri.MusteriAdres)) as [IL]
from Musteri

select 
substring(Musteri.MusteriAdres,(charindex('/',Musteri.MusteriAdres)) + 1, len(Musteri.MusteriAdres)) as [IL]
from Musteri order by IL ASC

select MONTH(Satis.SatisTarihi), Musteri.MusteriAdi,Musteri.MusteriSoyadi,Arac.Marka,Satis.SatisTarihi from Satis,Arac,Musteri where (Satis.SatisTarihi>='2008-01-01' and Satis.SatisTarihi<='2010-12-31') and Musteri.MusteriNo=Satis.MusteriNo and Arac.AracNo=Satis.AracNo


SELECT Satis.SatisTarihi,Musteri.MusteriAdi,Musteri.MusteriSoyadi,Arac.Marka from Satis,Musteri,Arac where Month(Satis.SatisTarihi) between 3 and 4 and Year(Satis.SatisTarihi) between 2008 and 2010 and Arac.AracNo=Satis.AracNo and Musteri.MusteriNo=Satis.MusteriNo

SELECT Alim.AlimTarihi,Musteri.MusteriAdi,Musteri.MusteriSoyadi,Arac.Marka from Alim,Musteri,Arac where Month(Alim.AlimTarihi) between 3 and 4 and Year(Alim.AlimTarihi) between 2008 and 2010 and Arac.AracNo=Alim.AracNo and Musteri.MusteriNo=Alim.MusteriNo

SELECT Satis.SatisTarihi,Satis.SatisFiyati,(select SUM(Satis.SatisFiyati) from Satis where Month(Satis.SatisTarihi) between 1 and 8 and Year(Satis.SatisTarihi) between 2008 and 2010) AS [Toplam Satis],(select AVG(Satis.SatisFiyati) from Satis where Month(Satis.SatisTarihi) between 1 and 8 and Year(Satis.SatisTarihi) between 2008 and 2010) AS [Ortalama Satis],(select SUM(Satis.SatisFiyati)-AVG(Satis.SatisFiyati) from Satis where Month(Satis.SatisTarihi) between 1 and 8 and Year(Satis.SatisTarihi) between 2008 and 2010) AS [Fark],Musteri.MusteriAdi,Musteri.MusteriSoyadi,Arac.Marka from Satis,Musteri,Arac where Month(Satis.SatisTarihi) between 1 and 8 and Year(Satis.SatisTarihi) between 2008 and 2010 and Arac.AracNo=Satis.AracNo and Musteri.MusteriNo=Satis.MusteriNo

Select ((select MAX(Arac.Fiyat) from Arac) - (Select MIN(Arac.Fiyat))) AS [Fiyatý En Yüksek Olan Araçla En Düþük Olan Arasýndaki Fark] from Arac

Select *  from Satis where Satis.SatisTarihi Between '01-01-2010' and '12-31-2010' 