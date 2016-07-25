# create a render database, let users input data

# require gem 
require 'sqlite3'

# create a SQLite3 database
db = SQLite3::Database.new("render_list.db")

create_table = <<-SQL
	CREATE TABLE IF NOT EXISTS render_list(
		id INTEGER PRIMARY KEY,
		project_name VARCHAR(255),
		type VARCHAR(255),
		render_cost INT,
		est_time_completion INT
	)
SQL

# create render list table if it doesn't exist already
db.execute(create_table)

