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
#   User.create!(
#   email: "janet@gmail.com",
#   first_name: "Janet",
#   last_name: "Marshall",
#   family_size: 3,
#   apartment_size: 100,
#   address: "676 President St Brooklyn, NY 11215",
#   password: "123456",
#   password_confirmation: "123456"
#   ),

# User.create!(
#   email: "bob@gmail.com",
#   first_name: "Bob",
#   last_name: "Jackson",
#   family_size: 1,
#   apartment_size: 50,
#   address: "675 President St Brooklyn, NY 11215",
#   password: "123456",
#   password_confirmation: "123456"
#   ),

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
  ),

User.create!(
  email: "sbentohaircut@gmail.com",
  first_name: "Amelia",
  last_name: "Seixas",
  family_size: 4,
  apartment_size: 100,
  address: "Rua São Bento, 33",
  password: "123456",
  password_confirmation: "123456",
  facebook_picture_url: "amelia.jpg"
  ),
User.create!(
  email: "canapeantique@sapo.pt",
  first_name: "Assunção",
  last_name: "Tavares",
  family_size: 4,
  apartment_size: 100,
  address: "Calçada Marquês Abrantes, 97",
  password: "123456",
  password_confirmation: "123456",
  facebook_picture_url: "assunçao.jpg"
  ),
User.create!(
  email: "renonauth@gmail.com",
  first_name: "Nathalie",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "Rua São Bento, 20",
  password: "123456",
  password_confirmation: "123456",
  facebook_picture_url: "nathalie.jpg"
  ),

User.create!(
  email: "mercearia@saloia.pt",
  first_name: "Mercearia",
  last_name: "Portuguesa",
  family_size: 4,
  apartment_size: 100,
  address: "Rua de São bento, 102",
  password: "123456",
  password_confirmation: "123456",
  facebook_picture_url: "sara.jpg"
  ),

User.create!(
  email: "atendimento@cnnatacao.pt",
  first_name: "Clube",
  last_name: "Natação",
  family_size: 4,
  apartment_size: 100,
  address: "209 Rua São Bento",
  password: "123456",
  password_confirmation: "123456"
  ),

User.create!(
  email: "geral@iseg.pt",
  first_name:"ISEG",
  last_name: "University",
  family_size: 4,
  apartment_size: 100,
  address: "6 Rua do Quelhas",
  password: "123456",
  password_confirmation: "123456",
  facebook_picture_url: "iseg.jpg"
  ),

User.create!(
  email: "vethospital@iseg.pt",
  first_name:"Hospital",
  last_name: "São Bento",
  family_size: 4,
  apartment_size: 100,
  address: "Rua de São bento, 164",
  password: "123456",
  password_confirmation: "123456",
  facebook_picture_url: "hospital.jpg"
  ),

User.create!(
  email: "galeria@gmail.pt",
  first_name:"Galeria",
  last_name: "São Roque",
  family_size: 4,
  apartment_size: 100,
  address: "Rua de São bento, 199B",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "deposito@gmail.pt",
  first_name:"Depósito",
  last_name: "Marinha Grande",
  family_size: 4,
  apartment_size: 100,
  address: "Rua de São bento, 159",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "bloop@gmail.pt",
  first_name:"Bloop",
  last_name: "Vinyl Shop",
  family_size: 4,
  apartment_size: 100,
  address: "Rua Santos-o-Velho, 58",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "museu@gmail.pt",
  first_name:"Museu",
  last_name: "Marioneta",
  family_size: 4,
  apartment_size: 100,
  address: "Rua da Esperança, 146",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "phhostel@gmail.pt",
  first_name:"PH Lisbon Hostel",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "Calçada Marquês Abrantes, 90",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "palacio@gmail.pt",
  first_name:"Palácio do Machadinho",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "Rua do Machadinho, 20",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "atelier145@gmail.pt",
  first_name:"Atelier 145",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "Rua de São Bento, 145",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "fadobedbreakfast@gmail.pt",
  first_name:"Fado Bed & Breakfast",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "Rua das Trinas, 14",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "cavalopau@gmail.pt",
  first_name:"Loja Cavalo de Pau",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "Rua de São Bento, 168",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "bocacafe@gmail.pt",
  first_name:"Boca Café",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "Rua de São Bento, 33",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "cheeseandwinesuite@gmail.pt",
  first_name:"Cheese & Wine",
  last_name: "Apartment Suites",
  family_size: 4,
  apartment_size: 100,
  address: "Calçada Marquês Abrantes, 40",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "cafesaobento@gmail.pt",
  first_name:"Café São Bento",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "212 Rua São Bento",
  password: "123456",
  password_confirmation: "123456",
  ),

User.create!(
  email: "mariosoares@gmail.pt",
  first_name:"Fundação Mário Soares",
  last_name: "",
  family_size: 4,
  apartment_size: 100,
  address: "176 Rua São Bento",
  password: "123456",
  password_confirmation: "123456",
  ),

]
# SolarPanel.create!(
#   size: 10,
#   efficiency: 3,
#   price: 2,
#   address: "676 President St Brooklyn, NY 11215",
#   user: users[0],
#   )

# SolarPanel.create!(
#   size: 8,
#   efficiency: 2,
#   price: 1,
#   address: "675 President St Brooklyn, NY 11215",
#   user: users[1],
#   )
#
# Nathalie id(8)
SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "20 Rua Guarda-Mor",
  user: users[6],
  )
# Assunção id(6)
 SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "10a Rua Guarda-Mor",
  user: users[5],
  )
# Amelia id(5)
 SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "10a Rua Guarda-Mor",
  user: users[4],
  )
# Sara id(8)
 SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "10a Rua Guarda-Mor",
  user: users[7],
  )
 # Hospital id(11)
 SolarPanel.create!(
  size: 7,
  efficiency: 4,
  price: 2,
  address: "10a Rua Guarda-Mor",
  user: users[10],
  )
require 'csv'

path = Dir.pwd

CSV.foreach(path + '/db/csv/consumption.csv', :headers => true) do |row|
  ConsumptionPattern.create!(row.to_hash)
end

CSV.foreach(path + '/db/csv/production.csv', :headers => true) do |row|
  ProductionPattern.create!(row.to_hash)
end













