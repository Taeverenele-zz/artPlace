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
user_1.add_role :client
user_2 = User.create!(first_name: 'Simon', last_name: 'Brown', email: ENV['USER_2_EMAIL'], password: ENV['USER_2_PASSWORD'])
user_2.add_role :client
admin_user = User.create!(first_name: 'Penny', last_name: 'Doe', email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'])
admin_user.add_role :admin

# create sample artwork data
Artwork.destroy_all
artwork_1 = Artwork.new(title: 'Skribble', author: 'Mary Smith', description: 'A unique skribble created with a pencil', price: 2000, user: user_1)
artwork_1.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/scribble.jpg')), filename: 'scribble.jpg')
artwork_1.save
artwork_2 = Artwork.new(title: 'Faces', author: 'Mary Smith', description: 'A painting of many faces', price: 3000, user: user_1)
artwork_2.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/faces.jpg')), filename: 'faces.jpg')
artwork_2.save
artwork_3 = Artwork.new(title: 'My Dog', author: 'Simon Brown', description: 'A painting of my dog', price: 5000, user: user_2)
artwork_3.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/dog.jpg')), filename: 'dog.jpg')
artwork_3.save
artwork_4 = Artwork.new(title: 'Mountains', author: 'Simon Brown', description: 'Photograph of mountains', price: 500, user: user_2)
artwork_4.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/mountains.jpg')), filename: 'mountains.jpg')
artwork_4.save
artwork_5 = Artwork.new(title: 'Stick man', author: 'Penny Doe', description: 'A drawing of Stick Man the children;s book character', price: 10000, user: admin_user)
artwork_5.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/stickman.jpg')), filename: 'stickman.jpg')
artwork_5.save

art_count = Artwork.count
user_count = User.count
puts "Art Created: #{art_count}"
puts "User Created: #{user_count}"


