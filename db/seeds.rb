# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user1 = User.create(username: "Test User", email: "test@test.se", password: "testpass")
user2 = User.create(username: "Colin McSeed", email: "colin@mcseed.se", password: "seedpass")
user3 = User.create(username: "Woop Woop", email: "woop@woop.se", password: "wooppass")

Project.delete_all
project1 = Project.create(projectname: "Cool project")
project2 = Project.create(projectname: "New project")
project3 = Project.create(projectname: "Rails project")
project4 = Project.create(projectname: "Other project")
project5 = Project.create(projectname: "Test project")
project6 = Project.create(projectname: "Not so cool project")

Task.delete_all
task1 = Task.create(taskname: "New task", description: "A fine description.", project: project1)
task2 = Task.create(taskname: "Cool task", description: "A lonesome description.", project: project1)
task3 = Task.create(taskname: "Best task", description: "A funny description.", project: project2)
task4 = Task.create(taskname: "An important task", description: "A fearsome description.", project: project2)
task5 = Task.create(taskname: "Task deluxe", description: "A luxurious description.", project: project3)
task6 = Task.create(taskname: "Nice task", description: "A cool description.", project: project4)
task7 = Task.create(taskname: "Bad task", description: "A sad description.", project: project4)
task8 = Task.create(taskname: "Blue task", description: "An overwhelming description.", project: project4)
task9 = Task.create(taskname: "Red task", description: "A fine description.", project: project5)
