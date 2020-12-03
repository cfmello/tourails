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
