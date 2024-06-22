CREATE DATABASE universe;
\c universe;
-- Create table galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    number_of_stars INT NOT NULL,
    is_visible BOOLEAN NOT NULL
);

-- Create table star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    mass NUMERIC NOT NULL,
    luminosity INT NOT NULL,
    has_planets BOOLEAN NOT NULL
);

-- Create table planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    diameter NUMERIC NOT NULL,
    has_life BOOLEAN NOT NULL,
    number_of_moons INT NOT NULL
);

-- Create table moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    radius NUMERIC NOT NULL,
    is_habitable BOOLEAN NOT NULL,
    distance_from_planet INT NOT NULL
);

-- Create additional table (e.g., space_station)
CREATE TABLE space_station (
    space_station_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    capacity INT NOT NULL,
    is_operational BOOLEAN NOT NULL
);
-- Insert rows into galaxy
INSERT INTO galaxy (name, description, number_of_stars, is_visible) VALUES
('Milky Way', 'Our home galaxy', 1000000000, TRUE),
('Andromeda', 'Nearest major galaxy', 1000000000, TRUE),
('Triangulum', 'Third largest in local group', 40000000, TRUE),
('Whirlpool', 'Spiral galaxy', 600000000, TRUE),
('Sombrero', 'Edge-on galaxy', 800000000, TRUE),
('Pinwheel', 'Face-on spiral galaxy', 1000000000, TRUE);

-- Insert rows into star
INSERT INTO star (name, galaxy_id, mass, luminosity, has_planets) VALUES
('Sun', 1, 1.989e30, 1, TRUE),
('Proxima Centauri', 2, 2.446e29, 0.0017, TRUE),
('Sirius', 3, 3.978e30, 25.4, TRUE),
('Vega', 4, 4.084e30, 40.12, TRUE),
('Betelgeuse', 5, 2.869e31, 120000, TRUE),
('Rigel', 6, 1.933e31, 120000, TRUE);

-- Insert rows into planet
INSERT INTO planet (name, star_id, diameter, has_life, number_of_moons) VALUES
('Mercury', 1, 4879.4, FALSE, 0),
('Venus', 1, 12104, FALSE, 0),
('Earth', 1, 12742, TRUE, 1),
('Mars', 1, 6779, FALSE, 2),
('Jupiter', 1, 139820, FALSE, 79),
('Saturn', 1, 116460, FALSE, 83),
('Uranus', 1, 50724, FALSE, 27),
('Neptune', 1, 49244, FALSE, 14),
('Proxima b', 2, 14200, FALSE, 0),
('Sirius b', 3, 12350, FALSE, 0),
('Vega b', 4, 14500, FALSE, 0),
('Betelgeuse b', 5, 20000, FALSE, 0);

-- Insert rows into moon
INSERT INTO moon (name, planet_id, radius, is_habitable, distance_from_planet) VALUES
('Moon', 3, 1737.1, FALSE, 384400),
('Phobos', 4, 11.267, FALSE, 9376),
('Deimos', 4, 6.2, FALSE, 23458),
('Io', 5, 1821.6, FALSE, 421700),
('Europa', 5, 1560.8, FALSE, 670900),
('Ganymede', 5, 2634.1, FALSE, 1070400),
('Callisto', 5, 2410.3, FALSE, 1882700),
('Titan', 6, 2575.5, FALSE, 1221870),
('Rhea', 6, 763.8, FALSE, 527108),
('Iapetus', 6, 734.5, FALSE, 3560820),
('Oberon', 7, 761.4, FALSE, 583520),
('Titania', 7, 788.4, FALSE, 435910),
('Umbriel', 7, 584.7, FALSE, 266000),
('Ariel', 7, 578.9, FALSE, 190900),
('Miranda', 7, 235.8, FALSE, 129390),
('Triton', 8, 1353.4, FALSE, 354800),
('Nereid', 8, 170, FALSE, 5513819),
('Proxima b Moon 1', 9, 142.3, FALSE, 100000),
('Sirius b Moon 1', 10, 150, FALSE, 150000),
('Vega b Moon 1', 11, 160, FALSE, 160000);

-- Insert rows into space_station
INSERT INTO space_station (name, description, capacity, is_operational) VALUES
('ISS', 'International Space Station', 10, TRUE),
('Tiangong', 'Chinese Space Station', 6, TRUE),
('Mir', 'Russian Space Station', 6, FALSE);
