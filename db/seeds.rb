# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
success_descriptions = {
  'Bom dia': '#0F5417',
  'Bom trabalho': '#2C7F35',
  'Que legal': '#1BF333',
  'Ficou bom': '#0D2910',
  'Gostei do que vi': '#7DBB84'
}

success_descriptions.each do |description, hexadecimal_color|
  attributes = {
    description: description,
    hexadecimal_color: hexadecimal_color,
    message_type: :success
  }
  Message.create(attributes)
end

failure_descriptions = {
  'Talvez na próxima': '#AB1D14',
  'Não foi dessa vez': '#660A05',
  'Oh não': '#D53931',
  'O que aconteceu?': '#EA7974',
  'Que ruim': '#4F0905'
}

failure_descriptions.each do |description, hexadecimal_color|
  attributes = {
    description: description,
    hexadecimal_color: hexadecimal_color,
    message_type: :failure
  }
  Message.create(attributes)
end