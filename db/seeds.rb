require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

# Create an admin user
unless User.find_by email: 'admin@example.com'
  admin = User.new(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld'
  )
  admin.skip_confirmation!
  admin.save!
end

users = User.all

puts "#{users.count} Users created."


