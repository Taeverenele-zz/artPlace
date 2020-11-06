# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create samle user data
User.destroy_all
user_1 = User.create!(first_name: 'Mary', last_name: 'Smith', email: ENV['USER_1_EMAIL'], password: ENV['USER_1_PASSWORD'])
user_2 = User.create!(first_name: 'Simon', last_name: 'Brown', email: ENV['USER_2_EMAIL'], password: ENV['USER_2_PASSWORD'])
admin_user = User.create!(first_name: 'Penny', last_name: 'Doe', email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'])
admin_user.add_role :admin

# create sample artwork data
Artwork.destroy_all
artwork = [
  {title: 'Skribble', author: 'Mary Smith', description: 'A unique skribble created with a pencil', price: 2000, user: user_1},
  {title: 'Faces', author: 'Mary Smith', description: 'A painting of many faces', price: 3000, user: user_1},
  {title: 'My Dog', author: 'Simon Brown', description: 'A painting of my dog', price: 5000, user: user_2},
  {title: 'Mountains', author: 'Simon Brown', description: 'Photograph of mountains', price: 500, user: user_2},
  {title: 'Stick man', author: 'Penny Doe', description: 'A drawing of Stick Man the children;s book character', price: 10000, user: admin_user}
]
Artwork.create!(artwork)
