# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user_1 = User.create!(email: ENV['USER_1_EMAIL'], password: ENV['USER_1_PASSWORD'])
user_2 = User.create!(email: ENV['USER_2_EMAIL'], password: ENV['USER_2_PASSWORD'])
admin_user = User.create!(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'])
admin_user.add_role :admin