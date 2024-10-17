SELECT 
  u."FirstName", u."LastName", age(rnr."DateOfBirth"), g."Gender", m."MarathonName", ev."EventName", c."CountryName",
  TO_CHAR((rei."RaceTime" ||'seconds')::interval, 'HH24:MI:SS') AS race_time,
  ROW_NUMBER() OVER (PARTITION BY ev."EventName" ORDER BY rei."RaceTime" ASC) AS pposition
FROM "Event" ev
INNER JOIN "Marathon" m ON ev."MarathonId" = m."MarathonId"
INNER JOIN "Country" c ON m."CountryCode" = c."CountryCode"
INNER JOIN "RegistrationEvent" rei ON ev."EventId" = rei."EventId"
INNER JOIN "Registration" reg ON rei."RegistrationId" = reg."RegistrationId"
INNER JOIN "Runner" rnr ON reg."RunnerId" = rnr."RunnerId"
INNER JOIN "User" u ON u."Email" = rnr."Email"
INNER JOIN "Gender" g ON rnr."GenderId" = g."GenderId"
WHERE ev."MarathonId" = '3' AND rei."RaceTime"!= 0
ORDER by ev."EventName" ASC, g."Gender" ASC, race_time ASC;