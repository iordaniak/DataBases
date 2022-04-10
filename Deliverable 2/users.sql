drop user if exists 'guest'@'%';
create user 'guest'@'%';
grant select on checkmate_db.game to 'guest'@'%';
grant select on checkmate_db.professional_game to 'guest'@'%';
grant select on checkmate_db.user_game to 'guest'@'%';
grant select on checkmate_db.participates to 'guest'@'%';
grant select on checkmate_db.tournament to 'guest'@'%';
grant select on checkmate_db.player to 'guest'@'%';
grant select on checkmate_db.professional to 'guest'@'%';
grant select on checkmate_db.engine to 'guest'@'%';
grant select on checkmate_db.engine_games_today to 'guest'@'%';
grant select on checkmate_db.professional_games_today to 'guest'@'%';
grant select on checkmate_db.tournament_now to 'guest'@'%';
grant select on checkmate_db.ratings to 'guest'@'%';

drop user if exists 'user'@'%';
create user 'user'@'%' identified by 'userpass';
grant select on checkmate_db.* to 'user'@'%';
grant insert, update on checkmate_db.adds_to_favorites_games to 'user'@'%';
grant insert, update on checkmate_db.adds_to_favorites_players to 'user'@'%';
grant insert, update on checkmate_db.user_game to 'user'@'%';
grant insert, update on checkmate_db.rates to 'user'@'%';

drop user if exists 'employee'@'localhost';
create user 'employee'@'localhost' identified by 'employeepass';
grant select on checkmate_db.* to 'employee'@'localhost';
grant insert, update on checkmate_db.game to 'employee'@'localhost';
grant insert, update on checkmate_db.professional_game to 'employee'@'localhost';
grant insert, update on checkmate_db.player to 'employee'@'localhost';
grant insert, update on checkmate_db.professional to 'employee'@'localhost';
grant insert, update on checkmate_db.engine to 'employee'@'localhost';
grant insert, update on checkmate_db.participates to 'employee'@'localhost';
grant insert, update on checkmate_db.tournament to 'employee'@'localhost';

drop user if exists 'admin'@'localhost';
create user 'admin'@'localhost' identified by 'adminpass';
grant all privileges on checkmate_db.* to 'admin'@'localhost';




