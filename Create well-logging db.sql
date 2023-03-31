CREATE TABLE Users (
	id_user SERIAL PRIMARY KEY,
	full_name VARCHAR(256) NOT NULL,
	status_name VARCHAR(256) NOT NULL,
	pass VARCHAR(256) NOT NULL
)

CREATE TABLE Projects(
	id_project SERIAL PRIMARY KEY,
	project_name VARCHAR(256) NOT NULL,
	user_id INT NOT NULL,

	FOREIGN KEY (user_id) REFERENCES Users (id_user)
)

CREATE TABLE Areas(
	id_area SERIAL PRIMARY KEY,
	area_name VARCHAR(256) NOT NULL,
	project_id INT NOT NULL,
	
	FOREIGN KEY (project_id) REFERENCES Projects (id_project)
)

CREATE TABLE Pickets(
	id_picket SERIAL PRIMARY KEY,
	x_coord REAL NOT NULL,
	y_coord REAL NOT NULL,
	
	electric_resistance REAL NULL,
	layer_density REAL NULL,
	gamma_ray REAL NULL,
	magnetic_field REAL NULL,
	creation_date DATE NOT NULL,
	
	area_id INT NOT NULL,
	
	FOREIGN KEY (area_id) REFERENCES Areas (id_area)
	
)

INSERT INTO Pickets (
	x_coord, 
	y_coord, 
	electric_resistance, 
	layer_density, 
	gamma_ray, 
	magnetic_field,
	creation_date,
	area_id)
VALUES 
(6,7,83,57,0.49,0.23,'12/12/2023', 4),
(4,7,0.1,0.8,0.6,0.01,'12/13/2023', 4)

select * from Pickets




-- INSERT INTO Users (full_name, status_name, pass)
-- VALUES
-- ('Bob', 'Employee', '123'),
-- ('Mark', 'Client', '333'),
-- ('Boss', 'Moderator', 'admin')

-- INSERT INTO Users (full_name, status_name, pass)
-- VALUES
-- ('Klint', 'Client', '111')

select * from Users
select * from Projects

-- INSERT INTO Projects (project_name, user_id)
-- VALUES
-- ('Mountains', 1),
-- ('Mountains', 2),
-- ('Mountains', 3),
-- ('Fields', 1),
-- ('Fields', 4),
-- ('Fields', 3)

-- INSERT INTO Areas (area_name, project_id)
-- VALUES
-- ('Gimalay', 1),
-- ('Alps', 1),
-- ('Great Plato', 4),
-- ('Siberian Plato', 4)



