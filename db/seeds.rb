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
artwork_1 = Artwork.new(title: 'Skribble', author: 'Mary Smith', description: 'A unique skribble created with a red pencil with a dump truck sticker', price: 2000, user: user_1, availability: true)
artwork_1.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/scribble.jpg')), filename: 'scribble.jpg')
artwork_1.save
artwork_2 = Artwork.new(title: 'Faces', author: 'Mary Smith', description: 'A drawing of many beautiful faces.', price: 3000, user: user_1, availability: true)
artwork_2.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/faces.jpg')), filename: 'faces.jpg')
artwork_2.save
artwork_3 = Artwork.new(title: 'My Dog', author: 'Simon Brown', description: 'A drawing of my cool dog', price: 5000, user: user_2, availability: true)
artwork_3.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/dog.jpg')), filename: 'dog.jpg')
artwork_3.save
artwork_4 = Artwork.new(title: 'Sheep', author: 'Simon Brown', description: 'A drawing of a blue sheep.', price: 500, user: user_2, availability: true)
artwork_4.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/sheep.jpg')), filename: 'sheep.jpg')
artwork_4.save
artwork_5 = Artwork.new(title: 'Stick man', author: 'Penny Doe', description: 'A drawing of Stick Man: a childrens book character. Leaves are purple because I did not have a green percil handy at the time.', price: 10000, user: admin_user, availability: true)
artwork_5.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/stickman.jpg')), filename: 'stickman.jpg')
artwork_5.save
artwork_6 = Artwork.new(title: 'Rainbow', author: 'Mary Smith', description: 'A drawing of a rainbow with all the colours I had available at the time.', price: 2000, user: user_1, availability: true)
artwork_6.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/rainbow.jpg')), filename: 'rainbow.jpg')
artwork_6.save
artwork_7 = Artwork.new(title: 'Mountains', author: 'Mary Smith', description: 'An intricate drawing of mountains from afar.', price: 3000, user: user_1, availability: true)
artwork_7.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/mountains.jpg')), filename: 'mountains.jpg')
artwork_7.save
artwork_8 = Artwork.new(title: 'ABC', author: 'Simon Brown', description: 'Drawing of stacking blocks with A B C letters on them.', price: 5000, user: user_2, availability: true)
artwork_8.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/abc.jpg')), filename: 'abc.jpg')
artwork_8.save
artwork_9 = Artwork.new(title: 'Fern', author: 'Simon Brown', description: 'An outline of a fern.', price: 500, user: user_2, availability: true)
artwork_9.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/fern.jpg')), filename: 'fern.jpg')
artwork_9.save
artwork_10 = Artwork.new(title: 'Rubbish Truck', author: 'Penny Doe', description: 'Every time I ask my 2 year old son what he would like me to draw, he says bin truck so here is one for you all.', price: 10000, user: admin_user, availability: true)
artwork_10.image.attach(io: File.open(File.join(Rails.root, 'app/assets/images/rubbish_truck.jpg')), filename: 'rubbish_truck.jpg')
artwork_10.save


art_count = Artwork.count
user_count = User.count
puts "Art Created: #{art_count}"
puts "User Created: #{user_count}"


