""" 
Title: db_init.sql
Author: Sarah Duprey
Date: September 10, 2021
Description: database initilization script for pysports
"""

DROP USER IF EXISTS 'pysports_user'@'localhost';

CREATE USER 'pysports_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'CyberSecSa2021!';

GRANT ALL PRIVILEGES ON pysports.* TO'pysports_user'@'localhost'

DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;

CREATE TABLE team (
    team_id     INT            NOT NULL     AUTO_INCREMENT,
    team_name   VARCHAR(75)    NOT NULL,
    mascot      VARCHAR(75)    NOT NULL,
    PRIMARY KEY(team_id)
);

CREATE TABLE player (
    player_id   INT            NOT NULL      AUTO_INCREMENT,
    first_name  VARCHAR(75)    NOT NULL,
    last_name   VARCHAR(75)    NOT NULL,
    team_id     INT            NOT NULL,
    PRIMARY KEY(player_id),
    CONSTRAINT fk_team
    FOREIGN KEY(team_id)
        REFERENCES team(team_id)
);

INSERT INTO team(team_name, mascot)
    VALUES('Team Ravenclaw', 'The Eagles');

INSERT INTO team(team_name, mascot)
    VALUES('Team Gryffindor', 'The Lions');

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Luna', 'Lovegood', (SELECT team_id FROM team WHERE team_name = 'Team Ravenclaw'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Cho', 'Chang', (SELECT team_id FROM team WHERE team_name = 'Team Ravenclaw'));

 INSERT INTO player(first_name, last_name, team_id)
    VALUES('Sybill', 'Trelawney', (SELECT team_id FROM team WHERE team_name = 'Team Ravenclaw'));

 INSERT INTO player(first_name, last_name, team_id)
    VALUES('Hermione', 'Granger', (SELECT team_id FROM team WHERE team_name = 'Team Gryffindor'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Ginny', 'Weasley', (SELECT team_id FROM team WHERE team_name = 'Team Gryffindor'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Minerva', 'McGonagall', (SELECT team_id FROM team WHERE team_name = 'Team Gryffindor'));
          
