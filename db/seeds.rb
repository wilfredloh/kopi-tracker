# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Roast.destroy_all
Roast.create(name: "Cinnamon")
Roast.create(name: "Light")
Roast.create(name: "City/Medium")
Roast.create(name: "Full City")
Roast.create(name: "Dark")
Roast.create(name: "French")
Roast.create(name: "Italian")
p "SEEDED ROAST DATA"
#################################
# Farm.destroy_all
Farm.create(location: "Singapore", phone_num: "9092 0123")
Farm.create(location: "USA", phone_num: "9810 6692 0123")
Farm.create(location: "Malaysia", phone_num: "6902 1092 0199")
Farm.create(location: "Canada", phone_num: "9999 2092 0129")
Farm.create(location: "Skyland", phone_num: "9810 0087 0392")
Farm.create(location: "Sri Lanka", phone_num: "9810 0092 0123")
Farm.create(location: "USA", phone_num: "9938 0292 1092")
p "SEEDED Farm DATA"