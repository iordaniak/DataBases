use checkmate_db;
select t.name 
from tournament t
where t.city = 'Athens' or t.city = 'Ikaria'