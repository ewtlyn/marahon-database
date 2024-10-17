select ev."EventName", count(rei."RaceTime") as count_of_runners, to_char( (round(avg(rei."RaceTime"), 0) ||'seconds')::interval, 'HH24:MI:SS' ) as avg_tim
from "Event" ev
inner join "RegistrationEvent" rei on ev."EventId" = rei."EventId"
where rei."RaceTime" != 0
group by ev."EventName"
order by "EventName"