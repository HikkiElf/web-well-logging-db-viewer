CREATE TABLE Users (
	id_user SERIAL PRIMARY KEY,
	full_name VARCHAR(256) NOT NULL,
	status_name VARCHAR(256) NOT NULL,
	pass VARCHAR(256) NOT NULL
)

CREATE TABLE Projects(
	id_project SERIAL PRIMARY KEY,
	project_name VARCHAR(256) NOT NULL
)

CREATE TABLE Users_projects(
	project_id INT NOT NULL,
	user_id INT NOT NULL,

	FOREIGN KEY (project_id) REFERENCES Projects (id_project),
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
(1, 1, 0.456, 40, null, 0.2, '2003-10-01', 1),
(2, 1, 0.465, 50, 0.001, 0.4, '2003-10-02', 1),
(3, 1, 0.231, 30, 0.002, 0.564, '2003-10-03', 1),
(1, 2, 0.111, 60, 0.003, 0.23, '2003-10-04', 2),
(1, 3, 0.222, 20, 0.004, 0.1, '2003-10-05', 2),
(3, 3, 0.333, 10, 0.005, 0.97, '2003-10-06', 3),
(4, 3, 0.444, 4, 0.006, 0.73, '2003-10-07', 3),
(5, 4, 0.555, 70, 0.007, 0.86, '2003-10-08', 3),
(6, 5, 0.666, 80, 0.008, 0.78, '2003-10-09', 3),
(7, 8, 0.777, 90, 0.009, 0.25, '2003-10-10', 3),
(11, 9, 0.888, 140, 0.01, 0.75, '2003-10-13', 4),
(123, 132, 0.999, 110, 0.011, 0.12, '2003-10-14', 4),
(10, 110, 0.98, 120, 0.012, 0.42, '2003-10-15', 4),
(9, 9, 83, 57, 0.49, 0.23, '10/16/2023', 4),
(8, 8, 0.1, 0.8, 0.6, 0.01, '10/17/2023', 4)

select * from Pickets
select * from Users_projects
select * from areas

INSERT INTO Users_projects
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(2, 4)

INSERT INTO Users (full_name, status_name, pass)
VALUES
('Bob', 'Employee', '123'),
('Mark', 'Client', '333'),
('Boss', 'Moderator', 'admin'),
('Klint', 'Client', '111')

select * from Users
select * from Projects

-- INSERT INTO Projects (project_name)
-- VALUES
-- ('Mountains'),
-- ('Fields')

-- INSERT INTO Areas (area_name, project_id)
-- VALUES
-- ('Gimalay', 1),
-- ('Alps', 1),
-- ('Great Plato', 2),
-- ('Siberian Plato', 2)



