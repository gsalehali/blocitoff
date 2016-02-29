require 'faker'

#create Users

50.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

admin = User.new(
  name:       'Admin User', 
  email:      'admin@example.com',
  password:   'helloworld',
)
admin.skip_confirmation!
admin.save!

users = User.all

500.times do
  Item.create!(
    user:   users.sample,
    name:   Faker::Lorem.sentence
  )
end

puts "Sedding finished"
puts "#{User.count} users created."
puts "#{Item.count} Items has been created."