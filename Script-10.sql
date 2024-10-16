select
	r."RunnerId",
	g."Gender",
	age(e."StartDateTime", r."DateOfBirth") as "Age",
	e."EventId",
	e."StartDateTime",
	re."RaceTime"
from
	"Runner" r 
join
	"Gender" g ON r."GenderId" = g."GenderId" 
join
	"Registration" reg on r."RunnerId" = reg."RunnerId"
join
	"RegistrationEvent" re on reg."RegistrationId" = re."RegistrationId"
join
	"Event" e on re."EventId" = e."EventId"
where 
	e."StartDateTime" < now() 
order by
	r."RunnerId", e."StartDateTime";