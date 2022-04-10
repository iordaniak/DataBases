use checkmate_db;
select pr.first_name, pr.last_name
from tournament t
	left join participates p on p.tournament_id = t.id 
	left join professional pr on pr.id = p.player_id
where t.name = '30th Open International Tournament Kavala 2021';