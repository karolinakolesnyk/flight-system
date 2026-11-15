CREATE TABLE [airline] (
	[airline_id] int IDENTITY(1,1) NOT NULL,
	[airline_name] nvarchar(50) NOT NULL,
	[country] nvarchar(40) NOT NULL,
	[headquarters_city] nvarchar(40),
	PRIMARY KEY ([airline_id])
);
CREATE TABLE [airplane] (
	[airplane_id] int IDENTITY(1,1) NOT NULL,
	[model] nvarchar(40) NOT NULL,
	[capacity] int NOT NULL,
	[manufacture_year] int NOT NULL,
	[airline_id] int NOT NULL,
	PRIMARY KEY ([airplane_id])
);
CREATE TABLE [employee] (
	[employee_id] int IDENTITY(1,1) NOT NULL,
	[user_name] nvarchar(30) NOT NULL,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[position] nvarchar(25) NOT NULL,
	[employment_date] date NOT NULL,
	[airline_id] int,
	[manager_id] int,
	[rate] float(53) NOT NULL,
	[bonus] float(53),
	PRIMARY KEY ([employee_id])
);
CREATE TABLE [flight] (
	[flight_id] int IDENTITY(1,1) NOT NULL,
	[flight_number] nvarchar(15) NOT NULL,
	[departure_city] nvarchar(40) NOT NULL,
	[arrival_city] nvarchar(40) NOT NULL,
	[departure_time] datetime NOT NULL,
	[arrival_time] datetime NOT NULL,
	[airplane_id] int NOT NULL,
	PRIMARY KEY ([flight_id])
);
CREATE TABLE [flight_crew] (
	[crew_id] int IDENTITY(1,1) NOT NULL,
	[flight_id] int NOT NULL,
	[employee_id] int NOT NULL,
	[crew_role] nvarchar(30) NOT NULL,
	PRIMARY KEY ([crew_id])
);
CREATE TABLE [customer] (
	[customer_id] int IDENTITY(1,1) NOT NULL,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[gender] nvarchar(1) NOT NULL,
	[birth_date] date NOT NULL,
	[phone_number] nvarchar(15) NOT NULL,
	[email] nvarchar(50) NOT NULL,
	[passport_number] nvarchar(20) NOT NULL,
	PRIMARY KEY ([customer_id])
);
CREATE TABLE [ticket] (
	[ticket_id] int IDENTITY(1,1) NOT NULL,
	[flight_id] int NOT NULL,
	[customer_id] int NOT NULL,
	[employee_id] int,
	[seat_number] nvarchar(5),
	[price] float(53) NOT NULL,
	[seat_class] nvarchar(20) NOT NULL,
	[transaction_type] nvarchar(20) NOT NULL,
	[transaction_moment] datetime NOT NULL,
	PRIMARY KEY ([ticket_id])
);
ALTER TABLE [airplane] ADD CONSTRAINT [airplane_fk4] FOREIGN KEY ([airline_id]) REFERENCES [airline]([airline_id]);
ALTER TABLE [employee] ADD CONSTRAINT [employee_fk6] FOREIGN KEY ([airline_id]) REFERENCES [airline]([airline_id]);
ALTER TABLE [employee] ADD CONSTRAINT [employee_fk7] FOREIGN KEY ([manager_id]) REFERENCES [employee]([employee_id]);
ALTER TABLE [flight] ADD CONSTRAINT [flight_fk6] FOREIGN KEY ([airplane_id]) REFERENCES [airplane]([airplane_id]);
ALTER TABLE [flight_crew] ADD CONSTRAINT [flight_crew_fk1] FOREIGN KEY ([flight_id]) REFERENCES [flight]([flight_id]);
ALTER TABLE [flight_crew] ADD CONSTRAINT [flight_crew_fk2] FOREIGN KEY ([employee_id]) REFERENCES [employee]([employee_id]);
ALTER TABLE [ticket] ADD CONSTRAINT [ticket_fk1] FOREIGN KEY ([flight_id]) REFERENCES [flight]([flight_id]);
ALTER TABLE [ticket] ADD CONSTRAINT [ticket_fk2] FOREIGN KEY ([customer_id]) REFERENCES [customer]([customer_id]);
ALTER TABLE [ticket] ADD CONSTRAINT [ticket_fk3] FOREIGN KEY ([employee_id]) REFERENCES [employee]([employee_id]);