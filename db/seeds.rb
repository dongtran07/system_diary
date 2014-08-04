# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.create(name: "Public Cloud", class_icon: "glyphicon glyphicon-leaf", bg_class: "bg-light-blue") 
Type.create(name: "Private Coud", class_icon: "glyphicon glyphicon-lock", bg_class: "bg-navy") 
