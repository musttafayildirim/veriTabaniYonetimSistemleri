tsqlde akýþ kontrolleri

begin end 
go to 
break 
if    ==> karar verme durumlarýnda kullanýlýr.
else ==> diðer durumlar için 
else if ==> þart iki





pozitif tam bölenlerinin toplamý kendisine esit olan sayýlara mükemmel sayý denir 
buna göre 0 ile 1000 arasýndaki mükemmel sayýlarý yazdýracak tsql kodlarýyla yazýnýz

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