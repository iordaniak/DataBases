select avg(p.rating_fide)
from professional pr 
	left join player p on p.id = pr.id
where pr.nationality = 'China'