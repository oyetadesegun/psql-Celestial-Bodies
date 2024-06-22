--curl -sL https://raw.githubusercontent.com/oyetadesegun/psql-Celestial-Bodies/main/universe.sql | psql --username=freecodecamp --dbname=postgres
CREATE TABLE IF NOT EXISTS checke (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
drop table checke;
