CREATE DATABASE universe;

CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  description TEXT,
  discovered_by VARCHAR(30),
  discovered_in_year INT);

CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  is_shrinking BOOLEAN,
  discovered_by VARCHAR(30),
  discovered_in_year INT);

CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  mass_in_kg NUMERIC,
  is_habitable BOOLEAN,
  discovered_by VARCHAR(30),
  discovered_in_year INT);

CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  is_habitable BOOLEAN,
  discovered_by VARCHAR(30),
  discovered_in_year INT);

CREATE TABLE alien_race(
  alien_race_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  is_hostile BOOLEAN NOT NULL);

ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(star_id);
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(planet_id);
ALTER TABLE alien_race ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);

INSERT INTO galaxy(name, description, discovered_by, discovered_in_year) 
VALUES
('Andromeda', 'Spiral galaxy approximately 2.537 million light-years from Earth.', 'Edwin Hubble', 1923),
('Milky Way', 'Barred spiral galaxy containing our Solar System.', 'Unknown', NULL),
('Whirlpool Galaxy', 'Interacting grand-design spiral galaxy in the constellation Canes Venatici.', 'Charles Messier', 1773),
('Sombrero Galaxy', 'Unbarred spiral galaxy in the constellation Virgo.', 'Pierre Méchain', 1781),
('Triangulum Galaxy', 'Spiral galaxy approximately 3 million light-years from Earth.', 'Giovanni Battista Hodierna', 1654),
('Cigar Galaxy', 'Barred spiral galaxy in the constellation Ursa Major.', 'William Herschel', 1779);

INSERT INTO star(name, is_shrinking, discovered_by, discovered_in_year, galaxy_id) 
VALUES
('Sun', false, 'Humans', 0, 1),
('Sirius', true, 'Ancient Egyptians', -2500, 2),
('Alpha Centauri', false, 'Thomas Henderson', 1839, 3),
('Betelgeuse', true, 'Sir John Herschel', 1836, 4),
('Proxima Centauri', false, 'Robert Innes', 1915, 5),
('Polaris', false, 'Greeks', -1600, 6);

INSERT INTO planet(name, mass_in_kg, is_habitable, discovered_by, discovered_in_year, star_id) 
VALUES
('Earth', 5.972e24, true, 'Humans', -100000, 1),
('Mars', 6.39e23, false, 'Humans', -1609, 2),
('Jupiter', 1.898e27, false, 'Galileo Galilei', 1610, 3),
('Saturn', 5.683e26, false, 'Galileo Galilei', 1610, 4),
('Uranus', 8.681e25, false, 'William Herschel', 1781, 5),
('Neptune', 1.024e26, false, 'Urbain Le Verrier', 1846, 6),
('Mercury', 3.285e23, false, 'Ancient astronomers', -3000, 1),
('Venus', 4.867e24, false, 'Ancient astronomers', -3000, 2),
('Pluto', 1.309e22, false, 'Clyde Tombaugh', 1930, 3),
('Kepler-186f', 3.9e24, true, 'NASA', 2014, 4),
('Proxima Centauri b', 1.27e25, true, 'European Southern Observatory', 2016, 5),
('HD 209458 b', 1.486e25, false, 'Geneva Observatory', 1999, 6);

INSERT INTO moon(name, is_habitable, discovered_by, discovered_in_year, planet_id) 
VALUES
('Luna', false, 'Humans', -100000, 1),
('Phobos', false, 'Asaph Hall', 1877, 2),
('Deimos', false, 'Asaph Hall', 1877, 2),
('Europa', true, 'Galileo Galilei', 1610, 3),
('Ganymede', false, 'Galileo Galilei', 1610, 3),
('Callisto', false, 'Galileo Galilei', 1610, 3),
('Titan', false, 'Christiaan Huygens', 1655, 4),
('Enceladus', true, 'William Herschel', 1789, 4),
('Mimas', false, 'William Herschel', 1789, 4),
('Triton', false, 'William Lassell', 1846, 5),
('Charon', false, 'James Christy', 1978, 6),
('Io', false, 'Galileo Galilei', 1610, 3),
('Rhea', false, 'Giovanni Domenico Cassini', 1672, 4),
('Dione', false, 'Giovanni Domenico Cassini', 1684, 4),
('Hyperion', false, 'William Cranch Bond', 1848, 4),
('Phoebe', false, 'William Henry Pickering', 1898, 4),
('Ariel', false, 'William Lassell', 1851, 5),
('Umbriel', false, 'William Lassell', 1851, 5),
('Miranda', false, 'Gerard Kuiper', 1948, 5),
('Tethys', false, 'Giovanni Domenico Cassini', 1684, 4);

INSERT INTO alien_race(name, is_hostile, galaxy_id) 
VALUES
('Klingons', true, 1),
('Vulcans', false, 2),
('Wookiees', false, 3),
('Sontarans', true, 4),
('Asari', false, 5);