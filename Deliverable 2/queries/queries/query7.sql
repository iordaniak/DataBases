use checkmate_db;
select p.player_id
from participates p 
	left join tournament t on 
		t.city = 'Athens' and 
        t.start_date >= '2020-01-01' and 
        t.end_date < '2021-01-01'
where p.tournament_id = t.id;