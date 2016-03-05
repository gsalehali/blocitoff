require 'faker'

#create Users

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

unless User.find_by(email: 'admin@example.com')
  admin = User.new(
    name:       'Admin User', 
    email:      'admin@example.com',
    password:   'helloworld',
  )
  admin.skip_confirmation!
  admin.save!
end 

users = User.all

500.times do
  Item.create!(
    user:   users.sample,
    name:   Faker::Hacker.say_something_smart,
    created_at: Time.now - rand(14 * 24 * 60).minutes
  )
end

puts "Sedding finished"
puts "#{User.count} users created."
puts "#{Item.count} Items has been created."