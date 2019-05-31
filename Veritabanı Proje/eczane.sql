create database EczaneSon

use EczaneSon 

create table Adres(
IlPlaka int primary key,
Il nvarchar(50)
 );

create table Uretici(
UreticiId int primary key identity(1,1),
UreticiAdi nvarchar(50),
TelNo nvarchar(13),
Aciklama nvarchar(250)
);

create table MalzemeFormu(
MalzemeFormId int primary key identity(1,1),
FormAdi nvarchar(25)
);

create table MalzemeAmbalaj(
MalzemeAmbalajId int primary key identity(1,1),
AmbalajAdi nvarchar(25)
);

create table MalzemeKategori(
MalzemeKategoriId int primary key identity(1,1),
KategoriAdi nvarchar(25)
);

create table Kampanya(
KampanyaId int primary key identity(1,1),
KampanyaAdi nvarchar(25),
KampanyaOrani tinyint,
BaslangicTarihi Date,
BitisTarihi Date
);

create table Fiyat(
FiyatId int primary key identity(1,1),
AlisFiyati money,
KDV tinyint,
KarOrani tinyint,
KampanyaId int foreign key references Kampanya(KampanyaId),
SatisFiyati money
);

create table Malzeme(
MalzemeKodu int primary key identity(1,1),
MalzemeAdi nvarchar(25),
UreticiId int foreign key references Uretici(UreticiId),
MalzemeAmbalajId int foreign key references MalzemeAmbalaj(MalzemeAmbalajId),
MalzemeFormId int foreign key references MalzemeFormu(MalzemeFormId),
MalzemeKategoriId int foreign key references MalzemeKategori(MalzemeKategoriId),
MalzemeBilgisi nvarchar(300),
FiyatId int foreign key references Fiyat(FiyatId)
);

create table MalzemeStok(
StokId int primary key identity(1,1),
MalzemeId int foreign key references Malzeme(MalzemeKodu),
MalzemeMiktari int
);

create table PersonelUnvan(
UnvanId int primary key identity(1,1),
UnvanAdi nvarchar(25)
);

create table PersonelBirimi(
BirimNo int primary key identity(1,1),
BirimAdi nvarchar(25)
);

create table Personel(
PersonelTCNo bigint primary key,
PersonelAdi nvarchar(30),
PersonelSoyadi nvarchar(30),
Adres int foreign key references Adres(IlPlaka),
Cinsiyet bit,
DogumTarihi date,
IseBaslamaTarihi date,
AktifMi bit,
BirimNo int foreign key references PersonelBirimi(BirimNo),
UnvanId int foreign key references PersonelUnvan(UnvanId),
Evlimi bit,
CocukSayisi int,
Maas money,
Prim money,
);

create table Hasta(
HastaTC bigint primary key,
HastaAdi Nvarchar(30),
HastaSoyadi nvarchar(30),
Adres int foreign key references Adres(IlPlaka),
Cinsiyeti bit,
DogumTarihi date
);

create table SaglikKurumu(
KurumNo int primary key,
Adi nvarchar(50),
Adresi int foreign key references Adres(IlPlaka)
);

create table Doktor(
DoktorKurumSicilNo int primary key identity,
DoktorAdi nvarchar(25),
DoktorSoyadi nvarchar(25),
Adres int foreign key references Adres(IlPlaka),
KurumNo int foreign key references SaglikKurumu(KurumNo)
);

create table Recete(
ReceteId int primary key identity(1,1),
DoktorKurumSicilNo int foreign key references Doktor(DoktorKurumSicilNo),
HastaTc bigint foreign key references Hasta(HastaTC), 
);

create table ReceteDetay(
ReceteId int foreign key references Recete(ReceteId),
MalzemeKodu int foreign key references Malzeme(MalzemeKodu),
Adet int
);

create table OdemeTipi(
OdemeTipId int primary key identity(1,1),
OdemeTipAdi varchar(25),
TaksitVarmi bit
);

create table SatisFatura(
SatisFaturaId int primary key identity(1,1),
HastaTc bigint foreign key references Hasta(HastaTC),
PersonelTcNo bigint foreign key references Personel(PersonelTCNo),
ReceteID int foreign key references Recete(ReceteID),
FaturaTarihi datetime,
OdemeTipId int foreign key references OdemeTipi(OdemeTipId),
ToplamTutar money
);

create table MalzemeAlim(
MalzemeAlimId int primary key identity(1,1),
UreticiId int foreign key references Uretici(UreticiId),
PersonelTCNo bigint foreign key references Personel(PersonelTCNo),
);

create table MalzemeAlimDetay(
AlimId int foreign key references MalzemeAlim(MalzemeAlimId),
MalzemeKodu int foreign key references Malzeme(MalzemeKodu),
UreticiId int foreign key references Uretici(UreticiId)
);

create table AlimFatura(
AlimFaturaId int primary key identity(1,1),
PersonelId bigint foreign key references Personel(PersonelTCNo),
MalzemeAlimId int foreign key references MalzemeAlim(MalzemeAlimId),
FaturaTarihi datetime,
OdemeTipId int foreign key references OdemeTipi(OdemeTipId),
ToplamTutar money
);

create table OdemeTipDetay(
OdemeTipId int foreign key references OdemeTipi(OdemeTipId),
SatisFaturaId int foreign key references SatisFatura(SatisFaturaId),
AlisFaturaId int foreign key references AlimFatura(AlimFaturaId),
TaksitSayisi int,
KalanTaksitSayisi int
);





-----------------------Kay�tlar

----- ADRES TABLOSU -------------

insert into Adres values (01,'Adana');
insert into Adres values (34,'Istanbul');
insert into Adres values (11,'Bilecik');
insert into Adres values (26,'Eski�ehir');
insert into Adres values (41,'Kocaeli');
insert into Adres values (57,'Sinop');
insert into Adres values (55,'Samsun');
insert into Adres values (53,'Rize');
insert into Adres values (61,'Trabzon');
insert into Adres values (07,'Antalya');
insert into Adres values (06,'Ankara');
insert into Adres values (52,'Ordu');
insert into Adres values (44,'K�tahya')
select * from Adres


-----------  HASTA TABLOSU ---------

insert into Hasta Values (36350134690,'Mustafa','YILDIRIM',34,1,'05-12-1997')
insert into Hasta Values (19952458475,'Ahmet','KARA',61,1,'11-11-2007')
insert into Hasta Values (12345975413,'Fatma','YILDIZ',34,0,'01-09-1997')
insert into Hasta Values (36658874125,'Mikail','YILDIRIM',34,1,'12-31-1997')
insert into Hasta Values (15648512312,'Hakan','�EL�K',57,1,'2-22-1995')
insert into Hasta Values (36350464545,'Nurettin','DURAN',55,1,'3-26-2001')
insert into Hasta Values (36345645212,'Salih','AKYOL',7,1,'12-12-1997')
insert into Hasta Values (34465132155,'G�khan','�OLAK',53,1,'07-21-1997')
insert into Hasta Values (36552244646,'Veli','F�L�Z',61,1,'01-25-1994')
insert into Hasta Values (45415646455,'Melis','YILDIRIM',57,0,'11-05-1997')
insert into Hasta Values (45645465451,'Ceyda','HIZ',34,0,'01-06-1995')
insert into Hasta Values (45465545612,'H�sniye','YA�AR',6,0,'02-01-1987')
insert into Hasta Values (15646587521,'Nurdan','DURAL',7,0,'12-05-1967')
insert into Hasta Values (56123154657,'Nurcan','DURAN',11,0,'05-04-1997')
insert into Hasta Values (24546875413,'Fadime','MUTLU',26,0,'07-09-1977')
insert into Hasta Values (36578645623,'H�meyra','TOPRAK',34,0,'02-08-1996')
insert into Hasta Values (45642132345,'�eyma','CANAN',41,0,'02-22-1992')
insert into Hasta Values (58675423123,'Cansu','Y�CEL',53,0,'05-25-1993')
insert into Hasta Values (65413214523,'Ece','DE��RMENC�',55,0,'08-12-1994')
insert into Hasta Values (46513246542,'�rem','DE��RMEN',57,0,'09-10-1999')
insert into Hasta Values (45613254652,'Merve','ILGAZ',61,0,'11-09-2008')
insert into Hasta Values (54642314623,'Ay�a','YILMAZ',1,0,'10-26-2012')
insert into Hasta Values (23654653212,'Melike','YAREN',6,0,'10-19-2016')
insert into Hasta Values (32654354522,'Meltem','YASAL',7,0,'9-18-2017')
insert into Hasta Values (12345645156,'Ay�e','TEMUR',26,0,'8-17-1998')
insert into Hasta Values (45613245468,'Burcu','ERGEN',11,0,'07-16-1999')
insert into Hasta Values (45645132135,'Berivan','DURMU�',26,0,'05-15-2000')
insert into Hasta Values (54985645312,'Beril','HATIRLI',6,0,'01-16-2001')
insert into Hasta Values (56497856453,'Canan','HAYIRLI',34,0,'05-13-2002')
insert into Hasta Values (45643213542,'Cemre','HAYIRSIZ',41,0,'01-09-2003')
insert into Hasta Values (15645787345,'Ceren','��M�EK',53,0,'01-12-2004')
insert into Hasta Values (45648972315,'Derya','D�REK',55,0,'01-10-2005')
insert into Hasta Values (45642134546,'Deniz','DERYA',57,0,'03-08-2006')
insert into Hasta Values (45641357878,'Dilara','Y�KSEL',61,0,'04-09-2007')
insert into Hasta Values (45489731213,'Eda','Y�KSEK',1,0,'06-07-2015')
insert into Hasta Values (12345954653,'Eslem','G�REN',6,0,'07-30-2016')
insert into Hasta Values (12354654233,'G�ls�m','G�R�R',11,0,'08-29-1975')
insert into Hasta Values (48974654123,'G�ler','�Y�G�R',57,0,'09-28-1977')
insert into Hasta Values (45643125455,'Hanife','ASLANT�RK',34,0,'01-27-1974')
insert into Hasta Values (34654678652,'Handan','AKT�RK',34,0,'11-26-1965')
insert into Hasta Values (34549787564,'Huriye','DURAN',34,0,'01-25-1994')
insert into Hasta Values (34567897812,'Jale','SATILMI�',34,0,'12-24-1993')
insert into Hasta Values (49787545342,'K�bra','HAST�RK',34,0,'12-09-1992')
insert into Hasta Values (48945645245,'Lale','CANDEM�R',41,0,'01-09-1991')
insert into Hasta Values (46546243546,'Leyla','DEM�R',1,0,'01-26-1990')
insert into Hasta Values (45674897415,'Melek','YILDIZ',41,0,'10-22-1997')
insert into Hasta Values (48978534347,'Nuray','YILDIRIM',41,0,'01-13-1997')
insert into Hasta Values (54897534245,'Sevim','DURAN',34,0,'01-15-1997')
insert into Hasta Values (56489753425,'Se�il','DURMU�',57,0,'12-17-1997')
insert into Hasta Values (85798465435,'Seren','YIL',34,0,'01-21-1995')
insert into Hasta Values (54543242123,'Sertap','AYDEM�R',34,0,'11-10-1986')
insert into Hasta Values (52323454566,'��kran','K�BAR',57,0,'10-08-1986')
insert into Hasta Values (64531245462,'T�rkan','TAKAR',34,0,'05-22-1982')
insert into Hasta Values (11354655645,'�nzile','MUTLU',34,0,'06-29-1984')
insert into Hasta Values (54654523424,'�znur','HAYIRLI',11,0,'07-19-1983')
insert into Hasta Values (53456462342,'Yeter','�ZT�RK',34,0,'06-09-1981')
insert into Hasta Values (45465687562,'Yeliz','YA�LI',34,0,'05-05-1988')
insert into Hasta Values (23456487855,'Ye�im','YE��L',11,0,'05-04-1998')
insert into Hasta Values (35465456465,'Zeynep','ZEYT�N',34,0,'01-09-2000')
insert into Hasta Values (12133454561,'S�meyye','YAL�IN',52,0,'12-02-1998')

select * from Hasta


insert into SaglikKurumu values (11000,'Bilecik Devlet Hastanesi',11);
insert into SaglikKurumu values (34100,'Beykoz Devlet Hastanesi',34);
insert into SaglikKurumu values (34200,'�mraniye Ara�t�rma Hastanesi',34);
insert into SaglikKurumu values (34300,'Kartal Devlet Hastanesi',34);
insert into SaglikKurumu values (52000,'Ordu Devlet Hastanesi',52);
insert into SaglikKurumu values (57000,'Sinop Devlet Hastanesi',57);
insert into SaglikKurumu values (01000,'Adana Devlet Hastanesi',01);
insert into SaglikKurumu values (44000,'K�tahya Devlet Hastanesi',44);
insert into SaglikKurumu values (44100,'Tav�anl� Devlet Hastanesi',44);
insert into SaglikKurumu values (41000,'Kocaeli Devlet Hastanesi',41);
insert into SaglikKurumu values (41100,'Gebze Devlet Hastanesi',41);
insert into SaglikKurumu values (26100,'Tepeba�� Ara�t�rma Hastanesi',26);
insert into SaglikKurumu values (53000,'Rize Devlet Hastanesi',53);
insert into SaglikKurumu values (61000,'Trabzon Devlet Hastanesi',61);
insert into SaglikKurumu values (55000,'Samsun Devlet Hastanesi',55);
insert into SaglikKurumu values (07000,'Antalya Devlet Hastanesi',07);

select * from SaglikKurumu


insert into Doktor values ('Mustafa','YILDIRIM',34,34100);
insert into Doktor values ('Ahmet','SEZER',34,34100);
insert into Doktor values ('Nuri','YAZAR',34,34100);
insert into Doktor values ('Sezen','S�YLER',11,11000);
insert into Doktor values ('S�meyye','YAL�IN',52,52000);
insert into Doktor values ('Kader','ALLI',57,57000)
insert into Doktor values ('Nurg�l','YE��M',01,01000)
insert into Doktor values ('Fehmi','BAKAR',44,44000);
insert into Doktor values ('�mer','HAKKI',44,44100);
insert into Doktor values ('�rem','BOZOK',41,41100);
insert into Doktor values ('Nurdan','AKTA�',41,41000);
insert into Doktor values ('Merve','�ENG�L',26,26100);
insert into Doktor values ('Merve','MERT',53,53000);
insert into Doktor values ('Mustafa','YILMAZ',61,61000);
insert into Doktor values ('Mikail','YILDIRIM',55,55000);
insert into Doktor values ('Fethi','�OKTAN',7,07000);
insert into Doktor values ('Enes','Y�KSEL',34,34300);
insert into Doktor values ('Emin','�NAN�',34,34200);
insert into Doktor values ('Salih','DURAN',34,34100);

select * from Doktor order by Adres

insert into PersonelUnvan values ('Eczane Teknisyeni');
insert into PersonelUnvan values ('Temizlik G�revlisi');
insert into PersonelUnvan values ('Genel Y�netici');
insert into PersonelUnvan values ('Eczac�');
insert into PersonelUnvan values ('Eczac� Kalfas�');
insert into PersonelUnvan values ('Muhasebe Sorumlusu')

select * from PersonelUnvan


insert into PersonelBirimi values('Muhasebe');
insert into PersonelBirimi values ('Temizlik');
insert into PersonelBirimi values ('�la� Sat���');
insert into PersonelBirimi values ('Depo');

select * from PersonelBirimi


insert into Personel values (36350134525,'Kemal','ZENG�N',34,1,'12-05-1972','01-01-2015',1,3,3,1,3,4000,300)
insert into Personel values (41565121324,'Ay�e','KARA',34,0,'12-05-1986','01-01-2017',1,2,2,0,0,1350,0)
insert into Personel values (45413456451,'Sezen','TEK�N',34,0,'01-01-1993','01-01-2016',1,4,4,0,0,4000,0)
insert into Personel values (12312313213,'Ahmet','DURMU�',34,1,'12-12-1990','01-01-2015',1,1,6,1,1,3000,100)
insert into Personel values (32546521354,'S�la','GEN�',34,1,'04-25-1992','01-01-2016',1,3,1,0,0,4000,0)
insert into Personel values (21324546231,'Nazl�','DURU',34,1,'04-13-1991','01-01-2016',1,3,4,0,0,4000,0)
insert into Personel values (34654513214,'Kaz�m','PARLAK',34,1,'06-30-1982','01-01-2016',1,3,5,0,0,4000,0)
insert into Personel values (35465468742,'Mahmut','VERG�L�',34,1,'07-28-1978','01-01-2016',0,3,1,1,0,4000,0)

select * from Personel

insert into Uretici values ('ABBOTT �LA� VE ECZ. T�C. LTD. �T�.','+902122541526','');
insert into Uretici values ('ABFEN FARMA SAN. VE T�C. LTD.�T�.','+902164521565','');
insert into Uretici values ('ACTAV�S �LA�LARI A.�.','+902122256595','');
insert into Uretici values ('ALCON LABORATUVARLARI T�C. A.�.','+902162541526','');
insert into Uretici values ('AL� RA�F �LA� SAN. A.�.','+902124523542','');
insert into Uretici values ('ATABAY K�MYA SAN. VE T�C. A.�.','+902165986532','');
insert into Uretici values ('BECTON D�CK�NSON MED�KAL �TH.�HR.LTD.�T�.','+902165541526','');
insert into Uretici values ('B�EM TIBB� C�HAZ VE �LA� SAN. LTD. �T�.','+902165986532','');
insert into Uretici values ('B�OFARMA �LA� SAN VE T�C A.�.','+902162356232','');
insert into Uretici values ('ER-K�M �LA� SAN. VE T�C. A.�.','+902124585236','');
insert into Uretici values ('G�LEAD SC�ENCES �LA� T�C. LTD. �T�.','+902164512365','');
insert into Uretici values ('MECOM SA�LIK �R�NLER� SAN. VE T�C. A.�.','+902164512585','');
insert into Uretici values ('MERKEZ �LA� SANAY� VE T�CARET A.�.','+902161234585','');
insert into Uretici values ('SERV�ER �LA� VE ARA�TIRMA A.�.','+902124562236','');

select * from Uretici

insert into MalzemeKategori values ('A��z-Di� Sa�l���');
insert into MalzemeKategori values ('Anne Bebek');
insert into MalzemeKategori values ('Bitkisel');
insert into MalzemeKategori values ('+18');
insert into MalzemeKategori values ('G�ne�');
insert into MalzemeKategori values ('Medikal');
insert into MalzemeKategori values ('Sa� Bak�m�');
insert into MalzemeKategori values ('V�cut Bak�m�');
insert into MalzemeKategori values ('Cilt Bak�m�');
insert into MalzemeKategori values ('G�z Sa�l���');
insert into MalzemeKategori values ('Burun Sa�l���');
insert into MalzemeKategori values ('�lkyard�m');
insert into MalzemeKategori values ('Spesifik Kremler');
insert into MalzemeKategori values ('A�r� Kesiciler');

select * from MalzemeKategori


insert into MalzemeFormu values ('Kaps�l');
insert into MalzemeFormu values ('Krem');
insert into MalzemeFormu values ('Ya�');
insert into MalzemeFormu values ('Sabun');
insert into MalzemeFormu values ('�ampuan');
insert into MalzemeFormu values ('Tablet');
insert into MalzemeFormu values ('Ampul');
insert into MalzemeFormu values ('Sprey');
insert into MalzemeFormu values ('�urup');
insert into MalzemeFormu values ('Sol�syon');
insert into MalzemeFormu values ('Gel');
insert into MalzemeFormu values ('Damla');
insert into MalzemeFormu values ('Macun');
insert into MalzemeFormu values ('Di�er');

select * from MalzemeFormu


insert into MalzemeAmbalaj values ('Kavanoz');
insert into MalzemeAmbalaj values ('Paket');
insert into MalzemeAmbalaj values ('Kutu');
insert into MalzemeAmbalaj values ('�i�e');
insert into MalzemeAmbalaj values ('Plastik');

select * from MalzemeAmbalaj


insert into Kampanya values ('%10 Kampanyas�',10,'04-23-2015','12-31-2022');
insert into Kampanya values ('%20 Kampanyas�',20,'04-23-2015','12-31-2022');
insert into Kampanya values ('%30 Kampanyas�',30,'06-23-2016','12-31-2022');
insert into Kampanya values ('%50 Yaz Kampanyas�',50,'06-23-2016','12-31-2022');
insert into Kampanya values ('%25 Yaz Kampanyas�',25,'06-23-2016','12-31-2022');
insert into Kampanya values ('%33 Yaz Kampanyas�',33,'06-23-2016','12-31-2022');
insert into Kampanya values ('%50 Kampanyas�',50,'04-23-2015','12-31-2022');


select * from Kampanya;


insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (50,8,8,1,52);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (11,8,8,16);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (25,8,10,30);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (20,8,8,28);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (30,8,8,50);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (10,8,8,28);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (100,8,8,2,106);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (120,8,8,3,113);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (5,8,8,4,6);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (20,8,8,5,22.5);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (25,8,8,6,27);
insert into Fiyat(AlisFiyati,KDV,KarOrani,KampanyaId,SatisFiyati) values (30,8,8,7,34);
insert into Fiyat(AlisFiyati,KDV,KarOrani,SatisFiyati) values (300,8,8,326.40);


select * from Fiyat;

insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId) values ('White Glo Pure',1,2,13,1,'White Glo Pure Saf & Do�al Di� Macunu 85ml + %100 Do�al Bambu Di� F�r�as� HED�YE',12);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)   values ('Curaprox Anne ve �ocuk',1,5,14,1,'Curaprox Anne ve �ocuk ��in �zel Di� F�r�as� Seti',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Signal White Now Touch',2,2,13,1,'Di� minesine zarar vermeyen form�l�yle an�nda beyazl�k sa�lar
Di� macunua,di� f�r�as�na,hatta suya bile gerek kalmadan art�k an�nda beyazl�k �antan�zda.',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Lierac Phytolastil',3,5,11,2,'Kar�n, basen ve g���s b�lgesinde h�zl� kilo al�m� ve vb. sebeplere ba�l� olu�an �atlaklara kar�� bak�m jeli. ',7);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Lansinoh G���s Pedleri',4,3,14,2,'G��s�n�z�n �eklini alarak do�al bir g�r�n�m sa�lar.
Hijyenik nedenlerle, teker teker paketlenmi�lerdir ve tek kullan�ml�kt�r.',4);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Dermo Oil 3l� Avantaj',5,3,3,2,'Dermo Oil, olu�abilecek �atlaklar�n g�r�n�m�n�n azalt�lmas�nda yard�mc� olabilmek i�in kullan�lan �atlak bak�m �r�n�d�r.
Mevcut �atlaklar�n g�r�n�mlerinin azalt�lmas� ve cilt tonundaki farkl�l�klar�n giderilmesinde de yard�mc�d�r.',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Oro �inko Krem',6,3,2,2,'Bez B�lgesi Bak�m�ndada kullan�labilen el ve v�cut kremi',9);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Babe Pediatri',7,3,14,2,'Su Bazl� Pi�ik Pat� 100ml 
Ekstra Yumu�ak �ampuan 200ml Banyo Jeli 500ml',8);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Babe G�ne� Koruyucu',8,3,8,5,'G�ne�e hassas cilt tiplerinde kullan�m� �nerilir.',13);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Dr. Murad Water Resistant',9,5,2,5,'T�m ciltlerin kullan�m�na uygun, suya dayan�kl� form�l� ile g�ne� ���nlar�na kar�� g�n boyu maksimum koruma sa�layan, y�z ve v�cut i�in g�ne� koruma kremidir.',14);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Chicco Latte',10,5,8,5,'Cildi g�ne� ���nlar�ndan UVA ve UVB koruyarak besler. Suya dayan�kl�d�r.',1);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Bioderma Photoderm',11,5,2,5,'Hassas ve reaktif ciltler i�in y�ksek koruma sa�layan g�ne� koruyucu.',16);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Durex Yak�n Hisset',12,2,14,4,'Daha �zel bir his i�in ekstra kayganla�t�r�c�l� ve ince prezervatif',11);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Zorah BIOLala',13,5,11,4,'D�nyada ilk ve tek probiyotik i�eren organik kayganla�t�c� ',16);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('TTO Lubricant Gel',14,3,11,4,'Bayanlar�n genital b�lge bak�m�n� sa�lar.  10ml daha eklenmi�tir.',10);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Silikon Kulak T�kac�',1,5,14,6,'Daha iyi uyumay� sa�layan ve suyun kula�a girmesini �nleyen yumu�ak bir silikonlu kulak koruyucudur',17);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Termometre',2,5,14,6,'Wee Baby Bebek Odas� Termometresi',18);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('92 Filtreli A��zl�k',3,2,14,6,'Filtreli A��zl�k',19);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Beyaz Hava Nemlendirici',4,3,14,6,'Hava nemlendirici',20);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Sar� Bidon',5,4,14,6,'PowerBar Sar� Bidon',21);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Aile Tart�s�',7,2,14,6,'Beurer Aile Tart�s� ',22);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Babe Sa� Losyonu',6,3,8,7,'Sa� d�k�lmesine kar�� kullan�l�r. Kepek ve sebuma kar�� etkili bir �ekilde dengeler.',23);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Floxia Enerji �ampuan�',8,5,5,7,'Kuru sa�lar i�in d�k�lmeyi �nlemeye yard�mc� �ampuan.',24);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Sa� D�k�lmesine Kar��',9,5,5,7,'Babe Sa� D�k�lmesine Kar�� �ampuan 250ml 
Babe Sa� D�k�lmesine Kar�� Losyon 125ml',25);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Aubrey Gpb',9,5,5,7,'Sa�lar�n�z�n g��l�, dolgun ve parlak g�r�nmesine yard�mc� olur',26);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Nivea Baby',10,5,5,7,'Bebe�inizin hem sa� hem v�cut temizli�i i�in kullan�labilen �zel bir �ampuand�r.',27);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Capicade Sa� D�k�lmesine',11,5,3,7,'Sa� d�k�lmesine kar�� bak�m losyonu.',28);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Mineralizing Water',11,4,8,9,'%89 Vichy Termal Suyu ve do�al hyal�ronik asit i�eren serum',29);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Ultra Sheer Grapefruit',12,4,15,9,'Nemlendirici cilt bak�m losyonu.',30);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Pore Purifying Clay Mask',12,2,15,9,'G�zenekleri ar�nd�rmaya yard�mc� kil maskesi',31);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Clairial Crema',13,3,2,9,'Yayg�n kahverengi lekelerin ayd�nlat�lmas�na yard�mc� olur. Cilt tonunu e�itler. Y�z, boyun, dekolte b�lgelerinde uygulanabilir.',32);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Pharma Bodytone Reveal',14,3,2,9,'El ve v�cuttaki koyu cilt lekerinin giderilmesine yard�mc� olur, cildi �st d�zeyde nemlendirir.',33);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Opti-Free Express',10,4,10,10,'Opti-Free Express Lens Sol�syonu kullananlar hakk�nda detayl� bilgi sahip olmak isteyenler yorumlar b�l�m�n� inceleyebilirler.',34);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Biotrue Multi-purpose',9,4,10,10,'Bausch Lomb Biotrue multi-purpose Lens Sol�syonu kullananlar hakk�nda detayl� bilgi sahip olmak isteyenler yorumlar b�l�m�n� inceleyebilirler.',35);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Adrusen Crono',9,3,6,10,'�la� de�ildir. Hastal�klar�n �nlenmesinde veya tedavi edilmesi amac�yla kullan�lmaz. Hamilelik, emzirme d�nemi, hastal�k veya ila� kullan�lmas� durumlar�nda doktorunuza dan���n�z.�r�nlerimiz ila� de�ildir, destek �r�nleridir.',36);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Nutrasea Deniz Suyu',10,3,8,11,'Nutrasea Deniz Suyu Burun Spreyi burun mukozas�n� nemlendirerek, havadaki mikroorganizmalara ve �e�itli zararl� maddelere kar�� burun mukozas�n� korur.
T�kanm�� burun deliklerinin a��lmas�nda, burun bo�lu�unu y�kamada, burun bo�luklar�n�n korunmas�n da yard�mc� olur.',35);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Quixx Extra',10,3,8,11,'Quixx extra hipertonik bir burun spreyidir. De�erli mineraller ve eser elementlere sahip Atlantik okyanus suyu ve okalipt�s ya�� i�ermektedir.',37);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Baby Drops Steril',10,2,13,11,'Bebeklerin burun bo�luklar� dard�r ve t�kanmas� kolayd�r. Ayr�ca s�mk�rme refleksleri de yoktur.',38);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Lamiderm Yan�k Kremi',9,5,2,13,'�nsan v�cudunun d�� k�s�mlar�na tek veya temel amac� bu k�s�mlar� temizlemek, koku vermek, g�r�n�m�n� de�i�tirmek, bunlar� korumak, iyi bir durumda tutmak veya v�cut kokular�n� d�zeltmek olan b�t�n madde veya kar���mlar� ifade eder.',39);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('TTO U�uk Kremi',8,5,2,13,'TTO Ucux Kremi 10 ml',19);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Cosakondrin MSM',8,4,6,3,'Tavsiye edilen g�nl�k porsiyon miktar� yeti�kinler i�in tok karn�na 2 tablet t�ketilmesi �eklindedir. Diyabet Hastalar�n�n Hekimlerine Dan��arak Kullanmalar� �nerilir.',40);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('New Life EFA-Vit Fruity',6,4,9,3,'Kullanmadan �nce �alkalay�n�z. Bu �r�n direkt olarak t�ketilebilece�i gibi, su, meyve suyu ya da yo�urda kar��t�r�larak da t�ketilebilir.',41);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Mega Joint',2,2,6,3,'G�da takviyesi olarak g�nde 1 Tablet kullan�lmas� �nerilir.',42);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Redoxon Kids',5,3,6,3,'4-10 ya� aras� �ocuklar i�in g�nde 2 adet, 10 ya� �st� �ocuklar i�in g�nde 3 adet t�ketilmesi �nerilir.
25 adet',43);

insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('Sunlife Zenergade',11,1,6,3,'G�nde 1 efervesan tableti bir bardak suda (250ml) eriterek i�iniz.',26);

insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ARFEN',10,3,7,14,'�lac�n etken maddesi Deksketoprofen� dir. ARFEN 50 mg/2 ml Enjeksiyonluk ��zelti Ampul, v�cutta  iltihap ve a�r�ya sebep olan belirli biyolojik etkenleri azaltan, iltihap giderici ve a�r� kesici bir ila�t�r.',44);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ARTHROTEC',14,3,6,14,'Diklofenak sodyum ve Misoprostol� dur.  �lac�n i�eri�inde bulunan Diklofenak sodyum, v�cutta iltihaba ve a�r�ya sebep olan belirli biyolojik fakt�rleri azaltarak, iltihap giderici ve a�r� kesici etki g�sterir.',43);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ATASPIN',2,2,6,14,'Asetilsalisilik asit� dir.ATASPIN 80 mg Tablet, v�cutta iltihaba, ate� ve a�r�ya sebep olan maddeleri azaltan iltihap �nleyici, a�r� kesici ve ate� d���r�c� bir ila�t�r.',39);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('LINCAINE % 10 Sprey',4,4,8,14,'LINCAINE % 10 Sprey, h�cre zar�ndaki sinirsel uyar�lar�n olu�umunu ve iletimini engelleyerek b�lgesel uyu�ma (lokal anestezik) sa�lar.',35);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('PRECOXIN % 10 Sprey',4,4,8,14,'PRECOXIN % 10 Sprey, h�cre zar�ndaki sinirsel uyar�lar�n olu�umunu ve iletimini engelleyerek b�lgesel uyu�ma (lokal anestezik) sa�lar.',36);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('KLORHEX Plus Oral Sprey',5,4,8,14,'KLORHEX Plus Oral Sprey, a��z bo�lu�u ve bo�az b�lgesinde iltihap giderici/a�r� kesici etkilerinin yan� s�ra a��z i�indeki mikroplar� �ld�r�c� ve geli�melerini engelleyici (antiseptik) etkilere de sahiptir.',37);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('DENTA-CLAR',6,3,6,15,'DENTA-CLAR 250 mg Film Tablet, v�cuttaki bakterilerle sava�arak , bakterilerin sebep oldu�u enfeksiyonlar� tedavi eden g��l� bir antibiyotiktir.',38);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('UNIKLAR',6,4,7,15,'UNIKLAR IV 500 mg Flakon, v�cuttaki bakterilerle sava�arak , bakterilerin sebep oldu�u enfeksiyonlar� tedavi eden g��l� bir antibiyotiktir. ',34);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('LARICID',5,2,6,15,'LARICID 125 mg/5 ml Oral S�spansiyon, v�cuttaki bakterilerle sava�arak , bakterilerin sebep oldu�u enfeksiyonlar� tedavi eden g��l� bir antibiyotiktir. ',39);
insert into Malzeme(MalzemeAdi,UreticiId,MalzemeAmbalajId,MalzemeFormId,MalzemeKategoriId,MalzemeBilgisi,FiyatId)  values ('ORADRO',3,3,7,15,'ORADRO 500 mg IV Flakon, v�cuttaki bakterilerle sava�arak , bakterilerin sebep oldu�u enfeksiyonlar� tedavi eden g��l� bir antibiyotiktir.',30);


select * from Malzeme order by UreticiId

insert into MalzemeAlim(UreticiId,PersonelTCNo) values (1,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (2,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (3,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (4,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (5,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (6,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (7,21324546231);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (8,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (9,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (10,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (11,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (12,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (13,45413456451);
insert into MalzemeAlim(UreticiId,PersonelTCNo) values (14,45413456451);

select * from MalzemeAlim

insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (1,1,6,10);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (1,1,7,10);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (1,1,21,25);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,22,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,8,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,50,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (2,2,55,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (3,3,62,150);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (3,3,9,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (3,3,23,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,24,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,10,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,56,75);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (4,4,57,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,51,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,58,25);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,61,30);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,25,60);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (5,5,13,90);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,11,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,27,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,49,60);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,59,60);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (6,6,60,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (7,7,12,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,14,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,28,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,47,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (8,8,48,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,26,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,46,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,39,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,40,150);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,29,70);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,15,170);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (9,9,30,75);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,16,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,31,200);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,41,300);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,42,500);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,45,50);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,38,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (10,10,53,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,52,250);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,32,300);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,33,150);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (11,11,17,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (12,12,18,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (12,12,34,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (12,12,35,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (18,13,36,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (18,13,19,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (19,14,20,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (19,14,37,100);
insert into MalzemeAlimDetay(AlimId,UreticiId,MalzemeKodu,Adet) values (19,14,54,100);


select * from MalzemeAlimDetay


insert into MalzemeStok values(6,10);
insert into MalzemeStok values(7,10);
insert into MalzemeStok values(21,25);
insert into MalzemeStok values(22,100);
insert into MalzemeStok values(8,100);
insert into MalzemeStok values(50,100);
insert into MalzemeStok values(55,100);
insert into MalzemeStok values(62,150);
insert into MalzemeStok values(9,100);
insert into MalzemeStok values(23,200);
insert into MalzemeStok values(24,50);
insert into MalzemeStok values(10,50);
insert into MalzemeStok values(56,75);
insert into MalzemeStok values(57,50);
insert into MalzemeStok values(51,100);
insert into MalzemeStok values(58,25);
insert into MalzemeStok values(61,30);
insert into MalzemeStok values(25,60);
insert into MalzemeStok values(13,90);
insert into MalzemeStok values(11,100);
insert into MalzemeStok values(27,50);
insert into MalzemeStok values(49,60);
insert into MalzemeStok values(59,60);
insert into MalzemeStok values(60,100);
insert into MalzemeStok values(12,100);
insert into MalzemeStok values(14,200);
insert into MalzemeStok values(28,200);
insert into MalzemeStok values(47,200);
insert into MalzemeStok values(48,200);
insert into MalzemeStok values(26,200);
insert into MalzemeStok values(46,100);
insert into MalzemeStok values(39,100);
insert into MalzemeStok values(40,150);
insert into MalzemeStok values(29,70);
insert into MalzemeStok values(30,75);
insert into MalzemeStok values(16,100);
insert into MalzemeStok values(31,200);
insert into MalzemeStok values(41,300);
insert into MalzemeStok values(42,500);
insert into MalzemeStok values(45,50);
insert into MalzemeStok values(38,100);
insert into MalzemeStok values(53,100);
insert into MalzemeStok values(52,250);
insert into MalzemeStok values(32,300);
insert into MalzemeStok values(33,150);
insert into MalzemeStok values(17,100);
insert into MalzemeStok values(18,100);
insert into MalzemeStok values(34,100);
insert into MalzemeStok values(35,100);
insert into MalzemeStok values(36,100);
insert into MalzemeStok values(19,100);
insert into MalzemeStok values(20,100);
insert into MalzemeStok values(37,100);
insert into MalzemeStok values(54,100);
insert into MalzemeStok values(15,170);


select * from MalzemeStok

insert into OdemeTipi values('Nakit',0);
insert into OdemeTipi values('Kredi Pe�in',0);
insert into OdemeTipi values('Kredi 3 Taksit',1);
insert into OdemeTipi values('Kredi 4 Taksit',1);
insert into OdemeTipi values('Kredi 6 Taksit',1);

select * from OdemeTipi


insert into AlimFatura values(21324546231,1,'05-04-2017',1,1500);
insert into AlimFatura values(21324546231,2,'03-03-2017',2,1500);
insert into AlimFatura values(21324546231,3,'01-04-2016',1,1500);
insert into AlimFatura values(21324546231,4,'08-05-2015',3,1500);
insert into AlimFatura values(21324546231,5,'07-09-2017',1,1500);
insert into AlimFatura values(21324546231,6,'06-10-2015',4,1500);
insert into AlimFatura values(21324546231,7,'11-15-2017',1,1500);
insert into AlimFatura values(45413456451,8,'05-12-2015',5,3000);
insert into AlimFatura values(45413456451,9,'05-12-2015',4,1500);
insert into AlimFatura values(45413456451,10,'06-13-2015',2,300);
insert into AlimFatura values(45413456451,11,'06-14-2015',1,3000);
insert into AlimFatura values(45413456451,12,'06-25-2016',1,1500);
insert into AlimFatura values(45413456451,18,'02-13-2015',1,1000);
insert into AlimFatura values(45413456451,19,'09-19-2016',1,1000);


select * from AlimFatura

insert into Recete values(1,11354655645);
insert into Recete values(1,12133454561);
insert into Recete values(1,12345645156);
insert into Recete values(2,12345954653);
insert into Recete values(2,12345975413);
insert into Recete values(2,12354654233);
insert into Recete values(3,15645787345);
insert into Recete values(3,15646587521);
insert into Recete values(3,15648512312);
insert into Recete values(4,19952458475);
insert into Recete values(4,23456487855);
insert into Recete values(4,23654653212);
insert into Recete values(5,24546875413);
insert into Recete values(5,32654354522);
insert into Recete values(5,34465132155);
insert into Recete values(6,34549787564);
insert into Recete values(6,34567897812);
insert into Recete values(6,34654678652);
insert into Recete values(7,35465456465);
insert into Recete values(7,36345645212);
insert into Recete values(7,36350134690);
insert into Recete values(8,36350464545);
insert into Recete values(8,36552244646);
insert into Recete values(8,36578645623);
insert into Recete values(9,36658874125);
insert into Recete values(9,45415646455);
insert into Recete values(9,45465545612);
insert into Recete values(10,45465687562);
insert into Recete values(10,45489731213);
insert into Recete values(10,45613245468);
insert into Recete values(10,45613254652);
insert into Recete values(11,45641357878);
insert into Recete values(11,45642132345);
insert into Recete values(11,45642134546);
insert into Recete values(12,45643125455);
insert into Recete values(12,45643213542);
insert into Recete values(12,45645132135);
insert into Recete values(13,45645465451);
insert into Recete values(13,45648972315);
insert into Recete values(13,45674897415);
insert into Recete values(14,46513246542);
insert into Recete values(14,46546243546);
insert into Recete values(14,48945645245);
insert into Recete values(15,48974654123);
insert into Recete values(15,48978534347);
insert into Recete values(15,49787545342);
insert into Recete values(16,52323454566);
insert into Recete values(16,53456462342);
insert into Recete values(16,54543242123);
insert into Recete values(17,54642314623);
insert into Recete values(17,54654523424);
insert into Recete values(17,54897534245);
insert into Recete values(18,54985645312);
insert into Recete values(18,56123154657);
insert into Recete values(18,56489753425);
insert into Recete values(19,56497856453);
insert into Recete values(19,58675423123);
insert into Recete values(19,64531245462);
insert into Recete values(19,65413214523);
insert into Recete values(19,85798465435);

select * from Recete

insert into ReceteDetay values(1,6,1);
insert into ReceteDetay values(1,7,2);
insert into ReceteDetay values(2,8,1);
insert into ReceteDetay values(2,9,2);
insert into ReceteDetay values(2,10,2);
insert into ReceteDetay values(3,11,3);
insert into ReceteDetay values(3,12,3);
insert into ReceteDetay values(3,14,3);
insert into ReceteDetay values(4,11,3);
insert into ReceteDetay values(4,15,2);
insert into ReceteDetay values(5,16,2);
insert into ReceteDetay values(5,17,2);
insert into ReceteDetay values(5,18,2);
insert into ReceteDetay values(6,18,2);
insert into ReceteDetay values(6,19,1);
insert into ReceteDetay values(6,20,1);
insert into ReceteDetay values(6,21,1);
insert into ReceteDetay values(6,22,1);
insert into ReceteDetay values(7,23,2);
insert into ReceteDetay values(7,24,1);
insert into ReceteDetay values(7,25,3);
insert into ReceteDetay values(7,26,1);
insert into ReceteDetay values(8,26,1);
insert into ReceteDetay values(8,27,1);
insert into ReceteDetay values(9,28,1);
insert into ReceteDetay values(9,29,2);
insert into ReceteDetay values(10,30,2);
insert into ReceteDetay values(11,31,2);
insert into ReceteDetay values(12,32,2);
insert into ReceteDetay values(13,33,1);
insert into ReceteDetay values(14,34,3);
insert into ReceteDetay values(14,35,1);
insert into ReceteDetay values(15,36,1);
insert into ReceteDetay values(15,37,1);
insert into ReceteDetay values(16,38,1);
insert into ReceteDetay values(16,39,1);
insert into ReceteDetay values(16,40,1);
insert into ReceteDetay values(17,41,1);
insert into ReceteDetay values(18,42,2);
insert into ReceteDetay values(19,43,1);
insert into ReceteDetay values(20,44,1);
insert into ReceteDetay values(21,45,1);
insert into ReceteDetay values(22,46,1);
insert into ReceteDetay values(23,47,1);
insert into ReceteDetay values(24,48,2);
insert into ReceteDetay values(24,49,3);
insert into ReceteDetay values(24,50,3);
insert into ReceteDetay values(24,51,3);
insert into ReceteDetay values(25,52,3);
insert into ReceteDetay values(26,53,3);
insert into ReceteDetay values(27,54,1);
insert into ReceteDetay values(28,55,2);
insert into ReceteDetay values(28,56,2);
insert into ReceteDetay values(29,57,2);
insert into ReceteDetay values(29,58,1);
insert into ReceteDetay values(30,59,1);
insert into ReceteDetay values(30,60,1);
insert into ReceteDetay values(31,61,1);
insert into ReceteDetay values(32,62,1);
insert into ReceteDetay values(33,1,1);
insert into ReceteDetay values(34,1,2);
insert into ReceteDetay values(35,1,2);
insert into ReceteDetay values(36,2,2);
insert into ReceteDetay values(37,3,2);
insert into ReceteDetay values(38,16,1);
insert into ReceteDetay values(39,54,2);
insert into ReceteDetay values(40,21,2);
insert into ReceteDetay values(40,12,1);
insert into ReceteDetay values(41,18,1);
insert into ReceteDetay values(42,32,1);
insert into ReceteDetay values(43,18,1);
insert into ReceteDetay values(44,22,1);
insert into ReceteDetay values(45,19,2);
insert into ReceteDetay values(46,20,3);
insert into ReceteDetay values(46,21,3);
insert into ReceteDetay values(46,22,1);
insert into ReceteDetay values(47,23,1);
insert into ReceteDetay values(48,24,1);
insert into ReceteDetay values(49,25,4);
insert into ReceteDetay values(50,26,5);
insert into ReceteDetay values(51,27,1);
insert into ReceteDetay values(52,28,1);
insert into ReceteDetay values(53,29,2);
insert into ReceteDetay values(54,30,2);
insert into ReceteDetay values(54,31,2);
insert into ReceteDetay values(55,33,1);
insert into ReceteDetay values(55,35,1);
insert into ReceteDetay values(56,36,3);
insert into ReceteDetay values(56,37,1);
insert into ReceteDetay values(57,39,1);
insert into ReceteDetay values(57,40,1);
insert into ReceteDetay values(58,41,1);
insert into ReceteDetay values(58,45,1);
insert into ReceteDetay values(58,56,2);
insert into ReceteDetay values(58,57,2);
insert into ReceteDetay values(59,58,2);
insert into ReceteDetay values(59,20,1);
insert into ReceteDetay values(59,35,1);
insert into ReceteDetay values(59,12,3);
insert into ReceteDetay values(60,16,3);
insert into ReceteDetay values(60,17,3);


select * from ReceteDetay


insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(11354655645,21324546231,1,'01-01-2017',1,84);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12133454561,21324546231,2,'01-02-2017',1,320);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12345645156,21324546231,3,'01-03-2017',1,1335);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12345954653,21324546231,4,'01-04-2017',1,279);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12345975413,21324546231,5,'01-05-2017',1,310.16);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(12354654233,21324546231,6,'01-05-2017',1,171.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(15645787345,21324546231,7,'01-05-2017',1,654.65);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(15646587521,21324546231,8,'01-05-2017',1,209.78);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(15648512312,21324546231,9,'01-05-2017',1,278.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(19952458475,21324546231,10,'01-05-2017',1,110);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(23456487855,32546521354,11,'01-06-2017',1,39.54);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(23654653212,32546521354,12,'01-06-2017',2,125.1);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(24546875413,32546521354,13,'01-06-2017',2,83.3);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(32654354522,32546521354,14,'01-06-2017',2,462.37);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34465132155,32546521354,15,'01-06-2017',2,358.17);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34549787564,32546521354,16,'01-06-2017',2,107.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34567897812,32546521354,17,'01-06-2017',2,23.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(34654678652,32546521354,18,'01-07-2017',1,50);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(35465456465,32546521354,19,'01-07-2017',1,338);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36345645212,32546521354,20,'01-07-2017',1,171);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36350134690,32546521354,21,'01-08-2017',1,18);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36350464545,34654513214,22,'01-08-2017',1,35);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36552244646,34654513214,23,'01-08-2017',1,8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36578645623,34654513214,24,'02-09-2017',1,793.8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(36658874125,34654513214,25,'02-10-2017',1,165);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45415646455,34654513214,26,'03-11-2017',1,45);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45465545612,34654513214,27,'03-12-2017',3,33.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45465687562,34654513214,28,'04-13-2017',3,187);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45489731213,34654513214,29,'04-14-2017',3,105);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45613245468,34654513214,30,'05-15-2017',1,62);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45613254652,34654513214,31,'05-16-2017',1,35);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45641357878,35465468742,32,'06-17-2017',1,149.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,33,'04-04-2018',5,14.84);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,34,'04-04-2018',5,67.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,35,'04-04-2018',5,22.26);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,36,'04-04-2018',5,11.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,37,'04-04-2018',5,110);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45645465451,35465468742,38,'08-23-2017',1,52);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45648972315,35465468742,39,'08-24-2017',1,34.8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(45674897415,35465468742,40,'09-25-2017',1,133);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(46513246542,36350134525,41,'09-26-2017',1,27);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(46546243546,36350134525,42,'09-27-2017',4,62.55);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(48945645245,36350134525,43,'09-28-2017',4,27);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(48974654123,36350134525,44,'09-29-2017',4,11.9);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(48978534347,36350134525,45,'10-30-2017',1,76.08);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(49787545342,36350134525,46,'11-01-2017',1,12.67);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(52323454566,36350134525,47,'12-02-2017',1,8);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(53456462342,36350134525,48,'01-02-2018',1,512.12);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54543242123,36350134525,49,'01-03-2018',1,57);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54642314623,36350134525,50,'01-04-2018',1,275);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54654523424,35465468742,51,'02-05-2018',1,126.42);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54897534245,35465468742,52,'02-06-2018',1,29.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(54985645312,35465468742,53,'02-07-2018',1,249);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(56123154657,35465468742,54,'03-08-2018',1,39.54);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(56489753425,35465468742,55,'03-08-2018',1,83.3);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(56497856453,21324546231,56,'03-08-2018',1,551.76);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(58675423123,35465468742,57,'04-01-2018',1,23.5);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(64531245462,35465468742,58,'04-02-2018',5,127);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(65413214523,35465468742,59,'04-03-2018',5,233.92);
insert into SatisFatura(HastaTc,PersonelTcNo,ReceteID,FaturaTarihi,OdemeTipId,ToplamTutar) values(85798465435,35465468742,60,'04-04-2018',5,696.24);

select * from SatisFatura where SatisFatura.OdemeTipId=3


insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,1);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,2);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,3);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,4);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,5);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,6);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,7);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,8);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,9);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,10);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,11);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,18);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,19);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,20);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,21);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,22);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,23);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,24);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,25);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,26);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,30);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,31);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,32);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,38);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,39);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,40);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,41);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,45);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,46);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,47);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,49);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,50);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,51);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,52);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,53);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,54);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,55);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,56);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,57);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(1,58);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,12);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,13);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,14);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,15);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,16);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId) values(2,17);
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,27,3,2,'04-12-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,28,3,2,'05-13-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,29,3,2,'04-14-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,27,3,1,'05-12-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,28,3,1,'06-13-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,29,3,1,'05-14-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,27,3,0,'06-14-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,42,4,3,'10-27-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,43,4,3,'10-28-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,44,4,3,'10-29-2017');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,33,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,34,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,35,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,36,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,37,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,59,6,5,'05-02-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,60,6,5,'05-03-2018');
insert into OdemeTipDetay(OdemeTipId,SatisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(5,61,6,5,'05-04-2018');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,15);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,17);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,19);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,21);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,25);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,26);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,27);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(1,28);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(2,16);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId) values(2,24);
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,18,3,2,'09-05-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,18,3,1,'10-05-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(3,18,3,1,'11-05-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,3,'10-07-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,2,'10-08-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,1,'10-09-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,20,4,0,'10-10-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,3,'12-06-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,2,'12-07-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,1,'12-08-2015');
insert into OdemeTipDetay(OdemeTipId,AlisFaturaId,TaksitSayisi,KalanTaksitSayisi,Tarih) values(4,23,4,0,'12-09-2015');

select * from OdemeTipDetay

****Firman�n yapm�� oldu�u t�m sat��lar�n faturalar�n� listeleyen sql sorgusu*********
1
select * from OdemeTipDetay,OdemeTipi,SatisFatura where OdemeTipi.OdemeTipId=OdemeTipDetay.OdemeTipId and OdemeTipi.OdemeTipId=SatisFatura.OdemeTipId and OdemeTipDetay.SatisFaturaId=SatisFatura.SatisFaturaId
***************
Firman�n yapm�� oldu�u t�m al�m i�lemlerinin faturalar�n� listeleyen sql sorgusu
2
select * from OdemeTipDetay,OdemeTipi,AlimFatura where OdemeTipi.OdemeTipId=OdemeTipDetay.OdemeTipId and OdemeTipi.OdemeTipId=AlimFatura.OdemeTipId and OdemeTipDetay.AlisFaturaId=AlimFatura.AlimFaturaId
******************************************************
3
Her �r�n�n hangi firmadan oldu�unu ve her �r�n�n formunu bilgisini, kategorisini, ambalaj bilgisini,malzeme bilgisini, �reticinin telefon numaras�n� listeleyecek sql sorgusunu yaz�n�z.

select Malzeme.MalzemeKodu,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.FormAdi,MalzemeKategori.KategoriAdi,Uretici.UreticiAdi,Uretici.TelNo,Uretici.Aciklama from Malzeme,MalzemeKategori,MalzemeFormu,MalzemeAmbalaj,MalzemeStok,Uretici where Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeStok.MalzemeId=Malzeme.MalzemeKodu and Malzeme.UreticiId=Uretici.UreticiId

*********************************************************************
4
Personelleri unvanlar�n� ve birimlerini yazacak �ekilde t�m �zellikleriyle listeleyiniz


select Personel.PersonelTCNo,Personel.PersonelAdi,Personel.PersonelSoyadi,Adres.Il,Personel.Cinsiyet,Personel.IseBaslamaTarihi,Personel.AktifMi,Personel.Evlimi,Personel.CocukSayisi,Personel.Maas,Personel.Prim,PersonelUnvan.UnvanAdi,PersonelBirimi.BirimAdi from Personel,PersonelUnvan,PersonelBirimi,Adres where Personel.BirimNo=PersonelBirimi.BirimNo and Personel.UnvanId=PersonelUnvan.UnvanId and Personel.Adres=Adres.IlPlaka

*************************************************************************************************
5
bug�ne kadar re�ete yazm�� olan t�m doktorlar� listeleyiniz..

select * from Doktor,Recete,ReceteDetay where Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Recete.ReceteId=ReceteDetay.ReceteId 

***************************************
6
Recete yaz�lm�� olan t�m hastalar� listeleyiniz...

select Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi,Adres.Il,Hasta.Cinsiyeti,Hasta.DogumTarihi,Recete.ReceteId,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati from Hasta,Recete,ReceteDetay,Malzeme,Fiyat,Adres where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Malzeme.FiyatId=Fiyat.FiyatId and Adres.IlPlaka=Hasta.Adres

*****************************************************
7
Bug�ne kadar hangi hastaya hangi doktor taraf�ndan hangi ila�lar yaz�lm�� ise bunlar� listeleyecek olan sql sorgusunu yaz�n�z ve s�ralama �l���� olarak doktorun ad�n� baz al�n�z...

select Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi,Adres.Il,Hasta.Cinsiyeti,Hasta.DogumTarihi,Recete.ReceteId,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati,Doktor.DoktorAdi,Doktor.DoktorSoyadi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.MalzemeFormId,MalzemeKategori.KategoriAdi from Hasta,Recete,ReceteDetay,Malzeme,Fiyat,Adres,Doktor,MalzemeKategori,MalzemeAmbalaj,MalzemeFormu where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Malzeme.FiyatId=Fiyat.FiyatId and Adres.IlPlaka=Hasta.Adres and Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId order by Doktor.DoktorAdi

*******************************************************
8
Anne bebek kategorisinde verilmi� olan ila�lar�n sahiplerini ve hangi doktor taraf�ndan verildi�ini listeleyecek sql sorgusunu yaz�n�z...


select Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi,Adres.Il,Hasta.Cinsiyeti,Hasta.DogumTarihi,Recete.ReceteId,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati,Doktor.DoktorAdi,Doktor.DoktorSoyadi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.MalzemeFormId,MalzemeKategori.KategoriAdi from Hasta,Recete,ReceteDetay,Malzeme,Fiyat,Adres,Doktor,MalzemeKategori,MalzemeAmbalaj,MalzemeFormu where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Malzeme.FiyatId=Fiyat.FiyatId and Adres.IlPlaka=Hasta.Adres and Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and MalzemeKategori.KategoriAdi='Anne Bebek' order by Doktor.DoktorAdi
***************************************************************
9
kampanyaya girmi� olan ilaclar� listeleyiniz.

select * from Kampanya,Fiyat,Malzeme,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori,MalzemeStok where Kampanya.KampanyaId=Fiyat.FiyatId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and Malzeme.MalzemeFormId=MalzemeFormu.MalzemeFormId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId and MalzemeStok.MalzemeId=Malzeme.MalzemeKodu and (Fiyat.KampanyaId=1 or Fiyat.KampanyaId=2 or Fiyat.KampanyaId=3 or Fiyat.KampanyaId=4 or Fiyat.KampanyaId=5 or Fiyat.KampanyaId=6 or Fiyat.KampanyaId=7)

******************************************************************************
10
��erisinde e harfi ge�en doktorlar� listeleyiniz..

select * from Doktor where Doktor.DoktorAdi LIKE '%e%'


*****************************************************
11
i�erisinde can ge�en isimleri listeleyiniz hastalar aras�ndan

select * from Hasta where Hasta.HastaAdi LIKE '%can%'


***********************************************************
12
hastalardan 18 ya��ndan k���k olanlar� isim s�ralamas�na g�re listeleyiniz

select * from Hasta where Hasta.DogumTarihi>'01-01-1999' order by Hasta.HastaAdi


**************************************************************************************
13
yap�lan toplam sat�� tutar�n� listeleyiniz..

select SUM(SatisFatura.ToplamTutar) AS 'Bug�ne Kadar Yap�lan Toplam Sat�� Tutar�' from SatisFatura

********************************************************
14
yap�lan sat�� say�s�n� listeleyiniz.

select Count(SatisFatura.SatisFaturaId) AS 'Satis Sayisi' from SatisFatura

**********************************************************************************
15
stokta olan antibiyotikleri listeleyiniz


select Malzeme.MalzemeKodu,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeKategori.KategoriAdi,MalzemeStok.MalzemeMiktari from MalzemeStok,MalzemeKategori,Malzeme where Malzeme.MalzemeKodu=MalzemeStok.MalzemeId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId and MalzemeKategori.KategoriAdi='Antibiyotik' and MalzemeStok.MalzemeMiktari>0

**************************************************************************************************
16
eczanenin bug�ne kadar alm�� oldu�u malzemelerin kim taraf�ndan hangi �retici taraf�ndan al�nd�klar�n� hangi tarihte al�nd�klar�n� listeleyiniz..

select Malzeme.MalzemeKodu,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.FormAdi,MalzemeKategori.KategoriAdi,Fiyat.SatisFiyati,Uretici.UreticiAdi,Personel.PersonelAdi,Personel.PersonelSoyadi,Personel.PersonelTCNo,PersonelBirimi.BirimAdi,PersonelUnvan.UnvanAdi,AlimFatura.FaturaTarihi from Malzeme,MalzemeAlimDetay,MalzemeAlim,AlimFatura,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori,Uretici,Fiyat,Personel,PersonelBirimi,PersonelUnvan where MalzemeAlim.MalzemeAlimId=MalzemeAlimDetay.AlimId and Malzeme.MalzemeKodu=MalzemeAlimDetay.MalzemeKodu and AlimFatura.MalzemeAlimId=MalzemeAlim.MalzemeAlimId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and Malzeme.MalzemeFormId=MalzemeFormu.MalzemeFormId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId and Malzeme.UreticiId=Uretici.UreticiId and Malzeme.FiyatId=Fiyat.FiyatId and Personel.BirimNo=PersonelBirimi.BirimNo and Personel.UnvanId=PersonelUnvan.UnvanId and AlimFatura.PersonelId=Personel.PersonelTCNo order by Malzeme.MalzemeKodu 




******************************
17
bug�ne kadar yap�lan al�mlar�n ortalama fiyat� nedir??

select AVG(AlimFatura.ToplamTutar) from AlimFatura,Malzeme,MalzemeAlim,MalzemeAlimDetay where Malzeme.MalzemeKodu=MalzemeAlimDetay.MalzemeKodu and MalzemeAlim.MalzemeAlimId=MalzemeAlimDetay.AlimId 



******************************************************
18
eczanenin bug�ne kadar kazanm�� oldu�u net gelir ne kadard�r??

select Sum(SatisFatura.ToplamTutar)-Sum(AlimFatura.ToplamTutar) from AlimFatura,Malzeme,MalzemeAlim,MalzemeAlimDetay,SatisFatura,Recete,ReceteDetay where Malzeme.MalzemeKodu=MalzemeAlimDetay.MalzemeKodu and MalzemeAlim.MalzemeAlimId=MalzemeAlimDetay.AlimId and AlimFatura.MalzemeAlimId=MalzemeAlim.MalzemeAlimId and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and SatisFatura.ReceteID=Recete.ReceteId

*****************************************************************************************
19
Personellere �denen toplam �cret ne kadard�r.

select SUM(Personel.Maas) AS 'Personellerin Ana Para Toplam�',Sum(Personel.Prim) as 'Toplam Prim',SUM(Personel.Maas)+Sum(Personel.Prim) AS 'Toplam Maa�lar�' from Personel 


*******************************************************
20
sat�lan malzemelerin herbirine %ka� kdv eklendi�ini g�sterecek sql sorgusunu yaz�n�z.


select Fiyat.KDV,Malzeme.MalzemeAdi,Fiyat.AlisFiyati,Fiyat.SatisFiyati from Fiyat,Malzeme where Malzeme.FiyatId=Fiyat.FiyatId


******************************************************
21
Doktorlar�n �al��makta olduklar� hastaneleri ve hangi hastalara bakt�klar�n� listeleyiniz..

select Doktor.DoktorAdi,Doktor.DoktorSoyadi,Adres.Il,Doktor.DoktorKurumSicilNo,Doktor.KurumNo,SaglikKurumu.Adi,Hasta.HastaTC,Hasta.HastaAdi,Hasta.HastaSoyadi from Doktor,SaglikKurumu,Hasta,Recete,Adres where Doktor.KurumNo=SaglikKurumu.KurumNo and Recete.HastaTc=Hasta.HastaTC and Doktor.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and Doktor.Adres=Adres.IlPlaka

************************************************************
22
Hastalardan soyadlar� en az alt� harf olanlar� soyadlar�na g�re azalan s�rada listeleyecek sql sorgusunu yaz�n�z.

select * from Hasta where Hasta.HastaSoyadi LIKE '%______%' order by Hasta.HastaSoyadi desc


***************************************************************************************************
23
doktorlardan istanbullu olup beykoz devlet hastanesinde �al��makta olanlar�n hastalar�n�n re�elerinde bulunan en pahal� ilac� listeleyiniz


select Doktor.DoktorAdi,Doktor.DoktorSoyadi,Doktor.KurumNo,Doktor.DoktorKurumSicilNo,Hasta.HastaAdi,Hasta.HastaSoyadi,Hasta.HastaTC,Hasta.DogumTarihi,Hasta.Cinsiyeti,Adres.Il,SaglikKurumu.Adi,Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeKategori.KategoriAdi,MalzemeAmbalaj.AmbalajAdi,MalzemeFormu.FormAdi,Fiyat.SatisFiyati from Doktor,SaglikKurumu,Adres,Hasta,Recete,ReceteDetay,Malzeme,Fiyat,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori where Doktor.KurumNo=SaglikKurumu.KurumNo and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Recete.HastaTc=Hasta.HastaTC and Recete.DoktorKurumSicilNo=Doktor.DoktorKurumSicilNo and Hasta.Adres=Adres.IlPlaka and SaglikKurumu.Adresi=Adres.IlPlaka and Doktor.Adres=Adres.IlPlaka and SaglikKurumu.Adi LIKE'%Beykoz%' and Doktor.Adres=34 and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and Fiyat.FiyatId=Malzeme.FiyatId and Fiyat.SatisFiyati=(Select Max(Fiyat.SatisFiyati) from Doktor,SaglikKurumu,Adres,Hasta,Recete,ReceteDetay,Malzeme,Fiyat,MalzemeAmbalaj,MalzemeKategori,MalzemeFormu where Doktor.KurumNo=SaglikKurumu.KurumNo and Recete.ReceteId=ReceteDetay.ReceteId and ReceteDetay.MalzemeKodu=Malzeme.MalzemeKodu and Recete.HastaTc=Hasta.HastaTC and Recete.DoktorKurumSicilNo=Doktor.DoktorKurumSicilNo and Hasta.Adres=Adres.IlPlaka and SaglikKurumu.Adresi=Adres.IlPlaka and Doktor.Adres=Adres.IlPlaka and SaglikKurumu.Adi LIKE'%Beykoz%' and Doktor.Adres=34 and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and MalzemeFormu.MalzemeFormId=Malzeme.MalzemeFormId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and Fiyat.FiyatId=Malzeme.FiyatId)


*****************************************************************************************************

24

Malzemelerden ortalaman�n �zerinde bir fiyata sahip olanlar� listeleyecek olan sql sorgusunu yaz�n�z..

select Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,Fiyat.SatisFiyati from Fiyat,Malzeme where Malzeme.FiyatId=Fiyat.FiyatId and Fiyat.SatisFiyati>(
select AVG(Fiyat.SatisFiyati) from Fiyat,Malzeme where Malzeme.FiyatId=Fiyat.FiyatId)



*****************************************************************************************************
25
malzemelerin kategorilerine g�re ortalama fiyatlar�n� listeleyiniz.

select MalzemeKategori.KategoriAdi,AVG(Fiyat.SatisFiyati) AS [Ortalama Sat�s] from Malzeme,Fiyat,MalzemeKategori where Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId and Fiyat.FiyatId=Malzeme.FiyatId group by MalzemeKategori.KategoriAdi order by MalzemeKategori.KategoriAdi DESC


******************************************************************************************************
26

BEGIN TRANSACTION
UPDATE Fiyat set Fiyat.KarOrani=0
select * from Fiyat
ROLLBACK
************************************************************

27

DECLARE @say1 INT, @say2 INT, @toplam INT
SET @say1=10
SET @say2=20
SET @toplam=@say1+@say2
Select @toplam AS 'TOPLAM'

****************************************************************

28

DECLARE @enyuksekmaas MONEY
Select @enyuksekmaas=MAX(Personel.Maas) From Personel
Select @enyuksekmaas

*****************************************************************
29

SELECT @@SERVICENAME,@@SERVERNAME,@@ERROR,@@VERSION,@@LANGUAGE

SELECT * FROM sys.messages


Select 5/0
Select * from master.dbo.sysmessages where error = @@ERROR

********************************************************************
30

Declare @Personel Table(
PersonelTcNo bigint
)
insert into @Personel values(12312313213)

select Personel.PersonelTCNo,Personel.PersonelAdi,Personel.PersonelSoyadi from Personel where Personel.PersonelTCNo in (select * from @Personel)

***************************************************************

31

DECLARE @eklenen table(
ad varchar(30),
soyad varchar(30),
maas money)

insert into Personel 
Output inserted.PersonelAdi,inserted.PersonelSoyadi,inserted.Maas
into @eklenen values (32563214586,'Zek','Soyda','34','','','','','1','1','','',3000,'')

select * from @eklenen



*****************************************************************************************

32

--Maa�� 3000'e e�it olup hi� prim almayan kay�tlar� silen tsql ifadesini yazal�m

DECLARE @silinenler TABLE(
ad varchar(30),
soyad varchar(30),
maas MONEY)
DELETE FROM Personel
OUTPUT deleted.PersonelAdi,deleted.PersonelSoyadi,deleted.Maas
into @silinenler
where Personel.Maas=3000 and Personel.Evlimi=0
Select * from @silinenler


********************************************************************************************

33

maa�� 1500 den az olan personelleri listeler e�er 1500den az olan personel yoksa personel yoktur diye mesaj verir.

if (select MIN(Personel.Maas) from Personel)>=1500
PRINT 'Maa�� 1500 den k���k olan perseonel yoktur.'
else 
select Personel.PersonelAdi,Personel.PersonelSoyadi,Personel.Maas from Personel where Personel.Maas<1500




***********************************************************************************************************
34
Declare @KategoridekiCesitlilikSayisi varchar(20)
select @KategoridekiCesitlilikSayisi = Count(MalzemeStok.MalzemeMiktari) from MalzemeStok,Malzeme,MalzemeKategori where Malzeme.MalzemeKodu=MalzemeStok.MalzemeId and MalzemeKategori.MalzemeKategoriId=Malzeme.MalzemeKategoriId group by MalzemeKategori.KategoriAdi order by MalzemeKategori.KategoriAdi DESC

IF(@KategoridekiCesitlilikSayisi<2)
BEGIN 
	PRINT '�e�itlilik Say�s�: '+ @KategoridekiCesitlilikSayisi
	PRINT '�e�itlik yetersiz'
	END
ELSE IF(@KategoridekiCesitlilikSayisi>=2 AND @KategoridekiCesitlilikSayisi<=5)
BEGIN
	PRINT '�e�itli malzeme say�s�: '+ @KategoridekiCesitlilikSayisi
	PRINT 'Yeterli'
END
ELSE
BEGIN 
PRINT '�e�itlilik say�s� '+ @KategoridekiCesitlilikSayisi
PRINT 'A��r� �e�itlilik var!!!!'
END

**********************************************************************
35
Personellerin cinsiyetlerini yazd�rd�m..

Use EczaneSon
GO 
Select Personel.PersonelAdi,Personel.PersonelSoyadi,'Personel.Cinsiyet'=
CASE Personel.Cinsiyet 
WHEN '1' THEN 'ERKEK'
WHEN '0' THEN 'KADIN'
END
FROM Personel order by Personel.PersonelAdi
GO


****************************************************************************
36
Urunlerin fiyatlar�ndan fiyatlar� 100 alt�nda olanlarda %20 art�� 100 lira ve 200 lira aras�nda olanlarda %10 art�� 200 lira ve 300 lira aras�nda olanlarda %15 art�� di�er durumlar i�in %5 art�� yapan tsql sorgusu

USE EczaneSon
GO
Update Fiyat
SET Fiyat.SatisFiyati = (
CASE 
	WHEN Fiyat.SatisFiyati <100 THEN Fiyat.SatisFiyati+((Fiyat.SatisFiyati*20)/100)
	WHEN Fiyat.SatisFiyati >=100 and Fiyat.SatisFiyati<=200 THEN Fiyat.SatisFiyati+((Fiyat.SatisFiyati*10)/100)
	WHEN Fiyat.SatisFiyati >200 and Fiyat.SatisFiyati<=300 THEN Fiyat.SatisFiyati+((Fiyat.SatisFiyati*15)/100)
	Else Fiyat.SatisFiyati + ((Fiyat.SatisFiyati*5)/100)
	END
)GO


Select * from Fiyat


************************************************************************************************************
37

Personellerin maa� ortalamas� 4000 den b�y�k yada e�it olana kadar maa�lar�n� %20 art�ran t-sql ifadesini yazal�m

Select 'Maas Ortalamasi= '+CAST(AVG(Personel.Maas) AS varchar(20)) from Personel
While (select AVG(Personel.Maas) From Personel)<4000 BEGIN
UPDATE Personel SET Maas=Maas*20/100+Maas
Select Personel.PersonelAdi+' '+Personel.PersonelSoyadi,Personel.Maas from Personel
END
Select 'Son Durum= '+CAST(AVG(Personel.Maas) AS varchar(20)) from Personel


**************************************************************************************************************
38
--hangi hastaya hangi malzemenin verildi�ini belirten store procedure yaz�n�z..

Create Procedure HastaRecete
AS
select Hasta.HastaAdi+' '+Hasta.HastaSoyadi AS 'Hasta Ad� ve Soyad�',Malzeme.MalzemeAdi,Malzeme.MalzemeBilgisi,MalzemeKategori.KategoriAdi from Hasta,Recete,ReceteDetay,Malzeme,MalzemeAmbalaj,MalzemeFormu,MalzemeKategori where Hasta.HastaTC=Recete.HastaTc and Recete.ReceteId=ReceteDetay.ReceteId and Malzeme.MalzemeKodu=ReceteDetay.MalzemeKodu and Malzeme.MalzemeFormId=MalzemeFormu.MalzemeFormId and Malzeme.MalzemeAmbalajId=MalzemeAmbalaj.MalzemeAmbalajId and Malzeme.MalzemeKategoriId=MalzemeKategori.MalzemeKategoriId
GO

HastaRecete


**************************************************************************************************************
39

Parametre olarak TC si verilen Hastan�n ad�n� soyad�n� ve do�um tarihini bulunuz...

Create Procedure HastaBul(
@HastaTC bigint=NULL,
@HastaAdi varchar(30)=NULL OUTPUT,
@HastaSoyadi varchar(30)=NULL OUTPUT,
@DogumTarihi date OUTPUT)
AS 
IF @HastaTC IS NOT NULL 
Select @HastaAdi=Hasta.HastaAdi,
		@HastaSoyadi=Hasta.HastaSoyadi,
		@DogumTarihi=Hasta.DogumTarihi
   from Hasta Where Hasta.HastaTC=@HastaTC
ELSE
   PRINT 'TC DEGERI BOS OLAMAZ'
GO
   Declare @HAdi varchar(30)
   Declare @Hsoyadi varchar(30)
   Declare @Tarih date
   EXECUTE HastaBul '12133454561',
@HAdi OUTPUT,
@Hsoyadi OUTPUT,@Tarih OUTPUT
Select @HAdi,@Hsoyadi,@Tarih

***************************************************************************************
40

B�y�k Harfe �evirme fonksiyonu

Create Function BuyukHarf(@veri VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS 
BEGIN
	RETURN UPPER(@veri)
END


select dbo.BuyukHarf(Personel.PersonelAdi),dbo.BuyukHarf(Personel.PersonelSoyadi) from Personel



*******************************************************************************************
41

create table aaa(
sss int
)

CREATE TRIGGER silme_Engeli
ON DATABASE
FOR DROP_TABLE
AS BEGIN
PRINT 'Tablo Silme ��lemi yasaklanm��t�r.'
ROLLBACK
END


drop table aaa

****************************************************************************************************
42

Create Trigger StokKontrol
on MalzemeAlimDetay
AFTER INSERT 
AS
Declare @AlimMiktari int
Declare @MalzemeKodu int
Select @AlimMiktari=MalzemeAlimDetay.Adet,@MalzemeKodu=MalzemeAlimDetay.MalzemeKodu
From MalzemeAlimDetay
UPDATE MalzemeStok SET MalzemeMiktari=MalzemeStok.MalzemeMiktari+@AlimMiktari
Where MalzemeStok.MalzemeId=@MalzemeKodu


select * from MalzemeAlim
insert into MalzemeAlim values(1,21324546231)

insert into MalzemeAlimDetay values(20,6,1,10)


select * from MalzemeAlimDetay
select * from MalzemeStok


*************************************************************************************
Create Trigger StokKontrolSatis
On ReceteDetay
AFTER INSERT 
AS
Declare @SatisMiktari int
Declare @StokMiktari int
Declare @MalzemeKodu int

Select @SatisMiktari=ReceteDetay.Adet, @MalzemeKodu=ReceteDetay.MalzemeKodu
from MalzemeStok

Select @StokMiktari=MalzemeStok.MalzemeMiktari from MalzemeStok where MalzemeStok.MalzemeId=@MalzemeKodu

IF(@SatisMiktari>@StokMiktari)
BEGIN
PRINT 'YETERS�Z STOK M�KTARI'
ROLLBACK
END 
ELSE 
UPDATE MalzemeStok SET MalzemeMiktari=MalzemeStok.MalzemeMiktari-@SatisMiktari
Where MalzemeStok.MalzemeId=@MalzemeKodu

**********************************************************************************************



select Malzeme.MalzemeAdi,Doktor.DoktorAdi from Malzeme,Doktor,Recete,ReceteDetay where Malzeme.MalzemeKodu=ReceteDetay.MalzemeKodu and Recete.ReceteId=ReceteDetay.ReceteId and Recete.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo and ReceteDetay.MalzemeKodu in(
select Max(ReceteDetay.MalzemeKodu) from Malzeme,Doktor,Recete,ReceteDetay where Malzeme.MalzemeKodu=ReceteDetay.MalzemeKodu and Recete.ReceteId=ReceteDetay.ReceteId and Recete.DoktorKurumSicilNo=Recete.DoktorKurumSicilNo)