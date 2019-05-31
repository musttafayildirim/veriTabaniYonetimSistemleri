use YarismaSitesi

--if
declare @us int
select @us=COUNT(Uye.UNo) from Uye

if(@us>=0 and @us<=5)
	begin
		print('Uye sayisi:'+cast(@us as varchar(10)))
		print('Az sayida uye var...')
	end
else if(@us>5 and @us<=20)
	begin
		print('Uye sayisi:'+cast(@us as varchar(10)))
		print('Yeterli sayida uye var...')
	end
else
	begin
		print('Uye sayisi:'+cast(@us as varchar(10)))
		print('Cok uye var...')
	end
GO

--Case
alter table Uye add Cinsiyet bit NULL

update Uye set Cinsiyet=1

insert into Uye values ('�akire','Aka�a�','',1,'123',2,25,0)

--
select Uye.UAdi,Uye.USoyadi,Uye.Cinsiyet,Cinsiyeti=
	Case Uye.Cinsiyet
		when 1 then 'Erkek'
		when 0 then 'Bayan'
	end
from Uye

--while 1-10 aras� yazd�racak

declare @sayac int
set @sayac=1
while (@sayac<=10)
	begin
		print(@sayac)
		set @sayac+=1
	end

go

--bir say�n�n asal say� olup olmad���n� g�steren kod

declare @sayi int
declare @say int
declare @durum int
set @sayi=70
set @say=1
set @durum=0
while(@say<=(@sayi-1))
	begin
		if((@sayi%@say=0) and (@say!=1))
			begin
				set @durum=1
			end
		set @say+=1
	end

if(@durum=1)
	begin
		print('Say� asal de�ildir.')
	end
else
	begin
		print('Say� asald�r.')
	end

go

--s�navda ��kabilecek tarzda bi soru olabilirmi�
--yar��ma sitesi veritaban� �zerinde olu�turulacak yeni bir tabloda her bir 
--�yenin bugune kadar ��zm�� oldu�u sorular ve bu sorulara vermi� oldu�u cevaplar tutulacakt�r. Gerekli olan alanlar� belirleyerek bu tabloyu olu�turunuz
--Daha sonra her bir �yenin bugune kadar ka� tane soru ��zd���n� bu sorulardan ka��na do�ru cevap verid�ini ka� tanesine yanl�� cevap verid�ini alm�� 
--oldu�u toplam puan� ekranda listeleyecek T-SQL kodlar�n� ve sql sorgusunu yaz�n�z.

create table cozulmus(CNo int primary key,Uno int foreign key references Uye(Uno),SNo int foreign key references Soru(SNo),Cevap varchar(5))

declare @sayac int
select Uye.UAdi,Uye.USoyadi,Sum(cozulmus.CNo) as 'toplam ��z�len',cozulmus.Cevap,Soru.DC as 'Do�ru cevab�',durum=

	Case Soru.DC
		when cozulmus.Cevap then 'do�ru yan�t'
		else 'yanl�� yan�t'
	end,
	while(COUNT())
		begin
			--Eksik var ��z
		end

from cozulmus inner join Soru on cozulmus.SNo=Soru.SNo 
		  inner join Uye on Uye.UNo=cozulmus.Uno
		  inner join 
 group by Uye.UAdi,Uye.USoyadi,cozulmus.CNO,cozulmus.Cevap,Soru.DC,Soru.SPuan


 go
 --Hata Yakalama
begin try
	select 5/0
end try
begin catch
	select ERROR_LINE() as 'Hata Sat�r�: ',ERROR_NUMBER() as 'Hata Numaras�:',ERROR_MESSAGE() as 'Hata Mesaj�: ',ERROR_SEVERITY() as 'Hata Derecesi:'
end catch

