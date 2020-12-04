# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating offers...'
capitais = ['Belém', 'Boa Vista', 'Macapá', 'Manaus', 'Palmas', 'Porto Velho', 'Rio Branco', 'Aracaju', 'Fortaleza', 'João Pessoa', 'Maceió', 'Natal', 'Recife', 'Salvador', 'São Luís', 'Teresina', 'Brasília', 'Campo Grande', 'Cuiabá', 'Goiânia', 'Belo Horizonte', 'Rio de Janeiro', 'São Paulo', 'Vitória', 'Curitiba', 'Florianópolis', 'Porto Alegre']
capitais.each do |capital|
  Offer.create(city: capital, description: "Conheça #{capital}, uma das capitais do Brasil", user_id: rand(1..4))
end
puts 'Offers created!'

puts 'Creating bookings'
Booking.create(date_start: "2020-12-07", date_end: "2020-12-07", user_id: 1, offer_id: 1, special_request: "asdf")
Booking.create(date_start: "2020-12-08", date_end: "2020-12-08", user_id: 2, offer_id: 1, special_request: "asdf")
Booking.create(date_start: "2020-12-09", date_end: "2020-12-09", user_id: 3, offer_id: 1, special_request: "asdf")
Booking.create(date_start: "2020-12-10", date_end: "2020-12-10", user_id: 1, offer_id: 1, special_request: "asdf")
Booking.create(date_start: "2020-12-11", date_end: "2020-12-11", user_id: 2, offer_id: 1, special_request: "asdf")
Booking.create(date_start: "2020-12-12", date_end: "2020-12-12", user_id: 3, offer_id: 1, special_request: "asdf")
