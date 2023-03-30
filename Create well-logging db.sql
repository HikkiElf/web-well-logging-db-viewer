create table Employees (
	id_employee SERIAL PRIMARY KEY,
	full_name VARCHAR(256) NOT NULL,
	post_name VARCHAR(256) NOT NULL,
)

create table Projects(
	id_project SERIAL PRIMARY KEY,
	project_name VARCHAR(256) NOT NULL,
	client_id INT,
	employee_id INT,
	area_id INT,

	FOREIGN KEY (client_id) REFERENCES Clients (id_client),
	FOREIGN KEY (employee_id) REFERENCES Employees (employee_id),
	FOREIGN KEY (area_id) REFERENCES Areas (id_area)
)

create table Pickets(
	id_picket SERIAL PRIMARY KEY,
	x_coord REAL NOT NULL,
	y_coord REAL NOT NULL,
	creation_date DATE NOT NULL
)

create table Clients (
	id_client SERIAL PRIMARY KEY,
	client_name VARCHAR(256)
)

create table Areas(
	id_area SERIAL PRIMARY KEY,
	area_name VARCHAR(256) NOT NULL,
	picket_id INT,
	FOREIGN KEY (picket_id) REFERENCES Pickets (id_picket)
)

create table Measurement_data(
	electric_resistance REAL,
	layer_density REAL,
	gamma_ray REAL,
	magnetic_field REAL,
	picket_id INT,
	FOREIGN KEY (picket_id) REFERENCES Pickets (id_picket)
)
