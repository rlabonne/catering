require 'faker'

# Create User1
user = User.new(
  :email => 'roblabonne+1@gmail.com',
  :password => 'password',
  :password_confirmation => 'password',
)
user.skip_confirmation!
user.save!
users = User.all

# Create User2
user = User.new(
  :email => 'roblabonne+2@gmail.com',
  :password => 'password',
  :password_confirmation => 'password',
)
user.skip_confirmation!
user.save!
users = User.all

# Create Contacts
30.times do
  Contact.create!(
    user: users.sample,
    firstName:  Faker::Name.first_name,
    lastName:   Faker::Name.last_name,
    company: Faker::Company.name,
    phone1: Faker::PhoneNumber.phone_number,
    phone2: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    address1: Faker::Address.street_address,
    address2: "",
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zipcode: Faker::Address.zip,
    notes: Faker::Job.title
  )
end
contacts = Contact.all

# Create Items
50.times do
  Item.create!(
    user: users.sample,
    name: Faker::Food.dish,
    description: Faker::Food.ingredient,
    category: Faker::Dessert.variety,
    yieldQty: Faker::Number.decimal(2),
    yieldUnit: Faker::Measurement.weight("none"),
    servingQty: Faker::Number.between(10, 20),
    price: Faker::Number.decimal(2),
    priceUnit: "each",
    notes: Faker::Dessert.topping
  )
end
items = Item.all

puts "Seed finished"
