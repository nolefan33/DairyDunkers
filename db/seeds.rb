# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chip = File.open(File.join(Rails.root, "/cookies/chip.jpg"))
coco = File.open(File.join(Rails.root, "/cookies/coco.jpg"))
ginger = File.open(File.join(Rails.root, "/cookies/ginger.jpg"))

Cookie.create({title: 'The Chip', description: 'Chocolatey', photo: chip})
Cookie.create({title: 'The Coco', description: 'Chocolatey-er', photo: coco})
Cookie.create({title: 'The Ginger', description: 'Not Chocolatey', photo: ginger})

Admin.create({email: "owner@test.com", password: "password"})