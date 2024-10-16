select
  m."MarathonName",
  e."EventName",
  re."RaceTime",
  RANK() over (partition by e."EventId" order by re."RaceTime" asc) as "Position",
  RANK() over (partition by e."EventId", g."GenderId" order by re."RaceTime" asc) as "PositionGender"
  from
  "Marathon" m 
join
  "Event" e on m."MarathonId" = e."MarathonId" 
join
  "RegistrationEvent" re on e."EventId" = re."EventId" 
join
  "Country" c on m."CountryCode" = c."CountryCode" 
left join 
  "Volunteer" v on c."CountryCode" = v."CountryCode" 
join 
  "Gender" g on g."GenderId" = g."GenderId";