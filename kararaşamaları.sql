tsqlde ak�� kontrolleri

begin end 
go to 
break 
if    ==> karar verme durumlar�nda kullan�l�r.
else ==> di�er durumlar i�in 
else if ==> �art iki





pozitif tam b�lenlerinin toplam� kendisine esit olan say�lara m�kemmel say� denir 
buna g�re 0 ile 1000 aras�ndaki m�kemmel say�lar� yazd�racak tsql kodlar�yla yaz�n�z

	declare @tp int =0;
      declare @i int;
	  declare @j int = 1;
      
	  while(@i<1000)
	  begin
		set @i=@i+1;
         set @tp=0;
           while(@j<@i)
		   begin              
           set @j=@j+1;
			if ((@i%@j)>=0)
             begin
                set @tp = @tp + @j;         
             end   
         end     
         
         if(@tp>=@i)
         begin
            print 'mukemmel sayi';
			print @i;       
            end
      end    