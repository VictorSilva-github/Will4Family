# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Receive.destroy_all
Message.destroy_all

victor = User.create!({
  fullname: "Vitor",
  birthday: "1990-01-01",
  # birthday: Date.new(1990, 01, 01),
  user_cheking: "60",
  tolerance_days: "5",
  document_type:"ID",
  document_number: "1231456789",
  phone_number: "+551121555786",
  gender: "Male",
  post_code:"123456789",
  address: "Rua Jerico",
  city: "Sao Paulo",
  country: "Brasil",
  email:"cap@gmail.com",
  password:"123123"
})

bernard = User.create!({
  fullname: "Bernard",
  birthday: "1993-01-01",
  user_cheking: "60",
  tolerance_days: "5",
  document_type: "ID",
  document_number: "1234233367189",
  phone_number: "+551121335786", # Corrigido o nome do atributo
  gender: "Female",
  post_code: "123456789",
  address: "Rua Jerico",
  city: "Sao Paulo",
  country: "Brasil",
  email: "cap2@gmail.com",
  password: "123123"
})

Receive.create!({
  name: "heitor",
  email: "email@gmail.com",
  relationship: "Amigo",
  phone_number: "5321555786",
  additional_info: "Nada",
  user_id: victor.id
})

message12 = Message.create!({
  title: "Teste 1",
  message_type: "Message",
  description: "Description 1",
  ultimate_date: "2021-01-01",
  user_id: victor.id
})
