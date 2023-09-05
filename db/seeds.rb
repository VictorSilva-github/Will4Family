# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

Victor = User.create!({
  fullname: "Vitor",
  birthday: Date.new(1990,01,01)
  document_type:111,
  document_number: 123456789,
  phone:number: 123456789,
  gender: "masculino"
  post_code:123456789
  address: "Rua Jerico"
  city: "Sao Paulo"
  country: "Brasil"
  email:"cap@gmail.com"
  password:"123456789"
})

Victor = User.create!({
  fullname: "Bernard"
  birthday: 1990/01/01
  document_type:111
  document_number: 123456789
  phone:number: 123456789
  gender: "masculino"
  post_code:123456789
  address: "Rua Jerico"
  city: "Sao Paulo"
  country: "Brasil"
  email:"cap2@gmail.com"
  password:"123456789"
})
