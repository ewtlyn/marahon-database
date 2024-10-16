select 
	"FirstName",
	"LastName",
	"CountryCode"
from
	"User" u 
join	
	"Runner" e on u."Email" = e."Email";