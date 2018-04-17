# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(code: 15021849, password: "12345678", password_confirmation: "12345678", role: 0, name: "Nguyễn Piggy")
User.create(code: 15021359, password: "12345678", password_confirmation: "12345678", role: 0, name: "Trần Minh Chiến")
User.create(code: 15021469, password: "12345678", password_confirmation: "12345678", role: 0, name: "Nguyễn CC")
User.create(code: 15021113, password: "12345678", password_confirmation: "12345678", role: 0, name: "Nguyễn Cảnh Sát")
User.create(code: 15021114, password: "12345678", password_confirmation: "12345678", role: 0, name: "Nguyễn Cứu thương")
User.create(code: 15021115, password: "12345678", password_confirmation: "12345678", role: 0, name: "Nguyễn Cứu hỏa")
User.create(code: "monitor", password: "12345678", password_confirmation: "12345678", role: 1)
User.create(code: "teacher", password: "12345678", password_confirmation: "12345678", role: 2)
rand = Random.new
points = []
50.times do |n|
  points << Point.new(point1: 10, point2: 10, point3: 10, user_name: Faker::HarryPotter.character, student_verify: true, monitor_verify: true)
end
Point.import! points