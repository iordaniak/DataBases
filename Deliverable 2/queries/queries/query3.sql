use checkmate_db;
select p.first_name, p.last_name
from professional p 
	left join adds_to_favorites_players f on f.username = 'alexandp'
where p.id = f.player_id