-- Show Table

CREATE TABLE show (
    show_id int NOT NULL,
    name VARCHAR(100),
	date_created DATE,
    PRIMARY KEY (show_id)
);

-- Performertype table

CREATE TABLE PerformerType (
    PerformerType_id int NOT NULL,
    name VARCHAR(100),
    PRIMARY KEY (PerformerType_id)
);

-- Performer Table

CREATE TABLE Performer (
    performer_id int NOT NULL,
    name VARCHAR(100),
    age int,
	years_exp INT,
	PerformerType_id int,
    PRIMARY KEY (performer_id),
    FOREIGN KEY (PerformerType_id) REFERENCES PerformerType(PerformerType_id)
);

-- Performance table

CREATE TABLE Performance (
    performance_id int NOT NULL,
    show_id int ,
    location_id int,
	name VARCHAR(100),
	price_USD FLOAT,
	date DATE,
	start_time TIME,
	end_time TIMESTAMP,
	ticket_sold INT,
    PRIMARY KEY (performance_id),
    FOREIGN KEY (show_id) REFERENCES show(show_id),
	FOREIGN KEY (location_id) REFERENCES location(location_id)

);


-- X_Performance_Performer Table

CREATE TABLE X_Performance_Performer (
    X_Performance_Performer_id int NOT NULL,
    performamnce_id int,
	performer_id INT,
    PRIMARY KEY (X_Performance_Performer_id),
    FOREIGN KEY (performamnce_id) REFERENCES Performance(performance_id),
	FOREIGN KEY (performer_id) REFERENCES Performer(performer_id)
);

-- X_Performance_equipment Table

CREATE TABLE X_performance_equipment (
    X_performance_equipment_id int NOT NULL,
    performamnce_id int,
    equipment_id int,
    PRIMARY KEY ( X_performance_equipment_id),
    FOREIGN KEY (performamnce_id) REFERENCES Performance(performance_id),
	FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);


-- Equipment Table 

CREATE TABLE Equipment (
    equipment_id int NOT NULL,
    PerformerType_id int ,
    description VARCHAR(100),
    PRIMARY KEY ( equipment_id),
	FOREIGN KEY (PerformerType_id) REFERENCES PerformerType(PerformerType_id)
);

-- HealthCheck Table

CREATE TABLE HealthCheck (
    healthcheck_id int NOT NULL,
    performer_id int ,
    healthstatus_id int,
	check_date DATE,
    PRIMARY KEY (healthcheck_id),
    FOREIGN KEY (performer_id) REFERENCES Performer(performer_id),
	FOREIGN KEY (healthstatus_id) REFERENCES HealthStatus(healthstatus_id)
);


-- HealthStatus Table

CREATE TABLE HealthStatus (
    healthstatus_id int NOT NULL,
    name VARCHAR(100),
	PRIMARY KEY (healthstatus_id)
);

-- Location table

CREATE TABLE location (
    location_id int NOT NULL,
    venue VARCHAR(100) ,
    city VARCHAR(100),
	state VARCHAR(100),
	population INT,
	locationtype_id int,
    PRIMARY KEY (location_id),
    FOREIGN KEY (locationtype_id) REFERENCES LocationType(locationtype_id)
);

-- MaintenanceType Table

CREATE TABLE MaintenanceType (
    maintenancetype_id int NOT NULL,
    name VARCHAR(100) ,
    PRIMARY KEY (maintenancetype_id)
);

-- MaintenanceCheck Table 

CREATE TABLE MaintenanceCheck (
    maintenancecheck_id int NOT NULL,
    equipment_id int,
    maintenancetype_id int,
	check_date DATE,
    PRIMARY KEY (maintenancecheck_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id),
	FOREIGN KEY (maintenancetype_id) REFERENCES MaintenanceType(maintenancetype_id)
);


-- LocationType Table

CREATE TABLE LocationType (
    locationtype_id int NOT NULL,
    name VARCHAR(100) ,
    PRIMARY KEY (locationtype_id)
);