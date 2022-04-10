use checkmate_db;
select 
	ug.white, 
	ug.black, 
    g.moves, 
    g.result, 
    g.type
from user_game ug 
	left join game g on g.id = ug.id
where ug.added_by = 'alexandp'