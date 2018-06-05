require "faker"

Player.destroy_all

50.times do
  first_name = Faker::Name.first_name
  Player.create!(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email(first_name),
    age: Faker::Number.between(1, 100),
    position: Player.positions.sample
  )
end

puts "Created #{Player.count} players!"
