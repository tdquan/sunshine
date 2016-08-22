 # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
SolarPanel.destroy_all
User.destroy_all

users = [
  User.create!(
  email: "janet@gmail.com",
  first_name: "Janet",
  last_name: "Marshall",
  family_size: 3,
  apartment_size: 100,
  address: "676 President St Brooklyn, NY 11215",
  password: "123456",
  password_confirmation: "123456"
  ),

User.create!(
  email: "bob@gmail.com",
  first_name: "Bob",
  last_name: "Jackson",
  family_size: 1,
  apartment_size: 50,
  address: "675 President St Brooklyn, NY 11215",
  password: "123456",
  password_confirmation: "123456"
  ),

User.create!(
  email: "maxime@gmail.com",
  first_name: "Maxime",
  last_name: "Longden",
  family_size: 2,
  apartment_size: 60,
  address: "20 Rua Guarda-Mor",
  password: "123456",
  password_confirmation: "123456"
  ),

User.create!(
  email: "fernando@gmail.com",
  first_name: "Fernando",
  last_name: "Mesquita",
  family_size: 3,
  apartment_size: 100,
  address: "10a Rua Guarda-Mor",
  password: "123456",
  password_confirmation: "123456"
  ),

User.create!(
  email: "maria.g@gmail.com",
  first_name: "Maria",
  last_name: "Gomes",
  family_size: 3,
  apartment_size: 100,
  address: "25 Rua Guarda-Mor",
  password: "123456",
  password_confirmation: "123456"
  ),

User.create!(
  email: "sandra@gmail.com",
  first_name: "Sandra",
  last_name: "Ferreira",
  family_size: 3,
  apartment_size: 100,
  address: "Rua Sao Bento 19",
  password: "123456",
  password_confirmation: "123456"
  )
]
SolarPanel.create!(
  size: 10,
  efficiency: 3,
  price: 2,
  address: "676 President St Brooklyn, NY 11215",
  user: users[0],
  )

SolarPanel.create!(
  size: 8,
  efficiency: 2,
  price: 1,
  address: "675 President St Brooklyn, NY 11215",
  user: users[1],
  )

  SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "20 Rua Guarda-Mor",
  user: users[2],
  )

 SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "10a Rua Guarda-Mor",
  user: users[3],
  )

  SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "25 Rua Guarda-Mor",
  user: users[4],
  )

  SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "Rua Sao Bento 19",
  user: users[5],
  )


require 'csv'

path = Dir.pwd

CSV.foreach(path + '/csv/consumption.csv', :headers => true) do |row|
  ConsumptionPattern.create!(row.to_hash)
end

CSV.foreach(path + '/csv/production.csv', :headers => true) do |row|
  ProductionPattern.create!(row.to_hash)
end













