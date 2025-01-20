declare @dir varchar(100)


set @dir = (select 'C:\Temp\BASE_PRODUCAO'
		+' '
		+convert(varchar,(year(getdate())))
		+'-'
		+convert(varchar,(month(getdate())))
		+'-'
		+convert(varchar,day(getdate())) 
		+'__'
		+ convert(varchar,datepart(hour,getdate()))
		+'-'
		+ convert(varchar,datepart(minute,getdate()))
		+'.bak')


backup database BASE_PRODUCAO to disk = @dir

