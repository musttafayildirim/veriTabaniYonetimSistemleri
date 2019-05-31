create database Ihaleler


use Ihaleler


create table Ihale(
INo int primary key identity(1,1),
IAdi varchar(30),
ITarih date,
Teminat money
);


create table Malzeme(
MNo int primary key identity(1,1),
MAdi varchar(30),
Stok int
);


Create table Personel(
PNo int primary key identity(1,1),
PAdSoyad varchar(60),
Birim varchar(30) 
);

Create table Firma(
FNo int primary key identity(1,1),
FAdi varchar(30),
Telefon varchar(13),
Yetkili int foreign key references Personel(PNo)
);

create table IhaleMalzeme(
INo int foreign key references Ihale(INo),
MNo int foreign key references Malzeme(MNo)
);

create table IhaleFirma(
INo int foreign key references Ihale(INo),
FNo int foreign key references Firma(FNo)
);

create table IhMalFirma(
INo int foreign key references Ihale(INo),
FNo int foreign key references Firma(FNo),
MNo int foreign key references Malzeme(MNo),
Fiyat money
);

create table Gazete(
GNo int primary key identity(1,1),
GAdi varchar(30)
);

create table IhaleGazete(
INo int foreign key references Ihale(INo),
GNo int foreign key references Gazete(GNo),
Adres varchar(150),
Yetkili int foreign key references Personel(PNo)
);

create table IhaleKomisyon(
INo int foreign key references Ihale(INo),
PNo int foreign key references Personel(PNo),
Birim varchar(30)
);

insert into Malzeme values ('Kag�t',10)
insert into Malzeme values ('Kalem',20)
insert into Malzeme values ('Cetvel',30)
insert into Malzeme values ('Silgi',40)
insert into Malzeme values ('Kag�t',15)


insert into Personel Values('Mustafa YILDIRIM','Genel M�d�r')
insert into Personel Values('Mikail YILDIRIM','M�d�r')
insert into Personel Values('S�meyye YAL�IN','Genel Sekreter')
insert into Personel Values('Hakan �OLAK','Muhasebe')
insert into Personel Values('Engin G�RG�N','G�venlik')
insert into Personel Values('Hande TABU','Sekreter')

insert into Firma values('YILDIRIM A.�','+902129566545',1);
insert into Firma values('YAL�IN L.T.D','+902129564154',2);


insert into Ihale values('Kag�t �halesi','12-05-2017',1000)

insert into IhaleFirma values(1,1)




Create trigger sil
on Firma
for delete 
as
begin
	declare @FNo int
	select @FNo=Firma.FNo from Firma
	delete from IhaleFirma where IhaleFirma.FNo=@FNo 
	delete from IhMalFirma where IhMalFirma.FNo=@FNo
 End
 Go

 delete from Firma where Firma.FNo=2

 select * from Firma



 ------------------------------------------------------

 select * from IhaleMalzeme,IhaleGazete,Malzeme where IhaleMalzeme.INo=IhaleGazete.INo and Malzeme.MNo=IhaleMalzeme.MNo


