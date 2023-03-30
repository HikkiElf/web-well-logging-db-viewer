CREATE TABLE Employees (
	id_employee SERIAL PRIMARY KEY,
	full_name VARCHAR(256) NOT NULL,
	post_name VARCHAR(256) NOT NULL
)

CREATE TABLE Projects(
	id_project SERIAL PRIMARY KEY,
	project_name VARCHAR(256) NOT NULL,
	client_id INT NOT NULL,
	employee_id INT NOT NULL,
	area_id INT NULL,

	FOREIGN KEY (client_id) REFERENCES Clients (id_client),
	FOREIGN KEY (employee_id) REFERENCES Employees (id_employee),
	FOREIGN KEY (area_id) REFERENCES Areas (id_area)
)

CREATE TABLE Pickets(
	id_picket SERIAL PRIMARY KEY,
	x_coord REAL NOT NULL,
	y_coord REAL NOT NULL,
	electric_resistance REAL NULL,
	layer_density REAL NULL,
	gamma_ray REAL NULL,
	magnetic_field REAL NULL,
	creation_date DATE NOT NULL
)

CREATE TABLE Clients (
	id_client SERIAL PRIMARY KEY,
	client_name VARCHAR(256) NOT NULL
)

CREATE TABLE Areas(
	id_area SERIAL PRIMARY KEY,
	area_name VARCHAR(256) NOT NULL,
	picket_id INT NOT NULL,
	
	FOREIGN KEY (picket_id) REFERENCES Pickets (id_picket)
)
