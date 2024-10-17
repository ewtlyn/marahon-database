select distinct u."FirstName", u."LastName", rnr."Email", rgs."RegistrationStatus", ev."EventTypeId"
from "User" u
INNER JOIN "Role" r ON u."RoleId" = r."RoleId"
inner join "Runner" rnr on u."Email" = rnr."Email"
inner join "Registration" reg on rnr."RunnerId" = reg."RunnerId"
inner join "RegistrationEvent" rei on reg."RegistrationId" = rei."RegistrationId"
inner join "Event" ev on rei."EventId" = ev."EventId"
inner join "RegistrationStatus" rgs on reg."RegistrationStatusId" = rgs."RegistrationStatusId"
where rgs."RegistrationStatusId" = 1
order by "EventTypeId" asc;