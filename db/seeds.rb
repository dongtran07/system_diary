# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.create(name: "Tecnology",class_icon: "glyphicon glyphicon-hdd", bg_class: "bg-green") 
Type.create(name: "Infomation",class_icon: "glyphicon glyphicon-info-sign", bg_class: "bg-light-blue") 
Type.create(name: "Question",class_icon: "glyphicon glyphicon-question-sign", bg_class: "bg-red") 
Type.create(name: "Discussion",class_icon: "glyphicon glyphicon-briefcase", bg_class: "bg-navy")