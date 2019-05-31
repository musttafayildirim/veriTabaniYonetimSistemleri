use ligVeritabani



select * from tblFutbolcu

select * from tblFutbolcuFikstur
select * from tblFikstur
select * from tblMusabaka

select * from tblPozisyon

select * from tblTakim









insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (8,4,2);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (8,8,2);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (9,8,3);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (9,4,1);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (10,1,3);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (11,16,1);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (12,16,2);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (13,21,3);
insert into tblFutbolcuFikstur(fiksturId,futbolcuId,golSayisi) values (14,22,1);

select * from tblFutbolcuFikstur





select * from tblFutbolcuFikstur,tblFutbolcu where tblFutbolcu.futbolcuId=tblFutbolcuFikstur.futbolcuId group by tblFutbolcuFikstur.golSayisi having MAX(golSayisi)


select tblFutbolcu.futbolcuAdi,MAX(tblFutbolcuFikstur.golSayisi) from tblFutbolcuFikstur,tblFutbolcu where tblFutbolcuFikstur.futbolcuId=tblFutbolcu.futbolcuId group by tblFutbolcu.futbolcuAdi
















