# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
success_descriptions = {
  good_day: '#0F5417',
  good_day_at_work: '#2C7F35',
  how_are_you: '#1BF333',
  greate_job: '#0D2910',
  not_so_bad: '#7DBB84'
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
  maybe_next_time: '#AB1D14',
  wasnt_this_time: '#660A05',
  oh_no: '#D53931',
  what_happened: '#EA7974',
  so_bad: '#4F0905'
}

failure_descriptions.each do |description, hexadecimal_color|
  attributes = {
    description: description,
    hexadecimal_color: hexadecimal_color,
    message_type: :success
  }
  Message.create(attributes)
end