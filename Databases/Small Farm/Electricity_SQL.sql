CREATE TABLE user_update (
	uuid UUID UNIQUE NOT NULL DEFAULT gen_random_uuid(),
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	last_update_by TEXT NOT NULL
);
COMMENT ON TABLE user_update IS 'Stores user information and when data was updated by user.';
COMMENT ON COLUMN user_update.uuid is 'The unique user ID.';
COMMENT ON COLUMN user_update.last_update is 'The date that the last update was made (yyyy-mm-dd hh:mm:ss).';
COMMENT ON COLUMN user_update.last_update_by is 'The name of the user responsible for the latest update.';


CREATE TABLE electricity_line_type (
  id SERIAL NOT NULL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  notes TEXT,
-- add unique together constraint for voltage and current
  current_amps FLOAT UNIQUE NOT NULL,
  voltage_volts FLOAT UNIQUE NOT NULL,
  -- 	Unique together
	UNIQUE(current_amps, voltage_volts),
  constraint electricity_line_type_unique_key unique (uuid)
) INHERITS (user_update);
COMMENT ON TABLE electricity_line_type IS 'Look up table for electricity line type.';
COMMENT ON COLUMN electricity_line_type.id is 'The unique electricity line type ID. Primary key.';
COMMENT ON COLUMN electricity_line_type.name is 'The electricity line type name.';
COMMENT ON COLUMN electricity_line_type.notes is 'The electricity line type notes.';
COMMENT ON COLUMN electricity_line_type.current_amps is 'The electricity line current.';
COMMENT ON COLUMN electricity_line_type.voltage_volts is 'The electricity line voltage.';

CREATE TABLE electricity_line (
  id SERIAL NOT NULL PRIMARY KEY,
	name TEXT UNIQUE,
  notes TEXT NULL,
	geometry GEOMETRY(LINESTRING, 4326) NOT NULL,
  electricity_line_type_uuid UUID NOT NULL REFERENCES electricity_line_type(uuid),
  constraint electricity_line_unique_key unique (uuid)
) INHERITS (user_update);
COMMENT ON TABLE electricity_line IS 'Stores information on electricity lines available.';
COMMENT ON COLUMN electricity_line.id is 'The unique electricity line ID. Primary key.';
COMMENT ON COLUMN electricity_line.notes is 'The electricity line notes.';
COMMENT ON COLUMN electricity_line.geometry is 'The electricity line geometry.';

CREATE TABLE electricity_line_condition (
  id SERIAL NOT NULL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  notes TEXT,
  constraint electricity_line_condition_unique_key unique (uuid)
) INHERITS (user_update);
COMMENT ON TABLE electricity_line_condition IS 'Look up table for electricity line condition.';
COMMENT ON COLUMN electricity_line_condition.id is 'The unique electricity line condition ID. Primary key.';
COMMENT ON COLUMN electricity_line_condition.notes is 'The additional information on electricity line condition.';

-- association table

CREATE TABLE electricity_line_conditions (
  date DATE NOT NULL,
  electricity_line_uuid UUID NOT NULL REFERENCES electricity_line(uuid),
  electricity_line_condition_uuid UUID NOT NULL REFERENCES electricity_line_condition(uuid),
  -- Unique together
  PRIMARY KEY (electricity_line_uuid, electricity_line_condition_uuid),
  constraint electricity_line_conditions_unique_key unique (uuid)
) INHERITS (user_update);
COMMENT ON TABLE electricity_line_conditions IS 'Associative table which stores the electricity line and condition.';
COMMENT ON COLUMN electricity_line_conditions.date is 'The electricity line inspection date.';      
