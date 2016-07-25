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

def add_project(db, project_name, type, render_cost, est_time_completion)
	db.execute("INSERT INTO render_list(project_name, type, render_cost,est_time_completion) VALUES(?, ?, ?, ?)",[project_name, type, render_cost,est_time_completion])
end

puts "What is the new project name?"
project_name = gets.chomp
puts "What type of project is it?"
type = gets.chomp
puts "What will be the render price?"
render_cost = gets.chomp.to_i
puts "What is the estimated time for compeltion? (days)"
est_time_completion = gets.chomp.to_i

add_project(db, project_name, type, render_cost, est_time_completion)