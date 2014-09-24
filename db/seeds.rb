# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author_one = Author.create! name: 'Luiz Cezer'
author_two = Author.create! name: 'Cezer Luiz'

category_one   = Category.create! name: 'Esportes'
category_two   = Category.create! name: 'Programação'
category_three = Category.create! name: 'Cultura'