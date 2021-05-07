# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###############################################################

puts "Cadastrando as CATEGORIAS..."
categories = [ "Animais e acessórios",
               "Esportes",
               "Para a sua casa",
               "Eletrônicos e celulares",
               "Música e hobbies",
               "Bebês e crianças",
               "Moda e beleza",
               "Veículos e barcos",
               "Imóveis",
               "Empregos e negócios" ]   

categories.each do |category|
  Category.find_or_create_by(description: category)
end
puts "CATEGORIAS cadastradas com sucesso !"

###############################################################

puts "Cadastrando MEMBRO PADRÃO..."
member = Member.new(email: "member@member.com",
              password: "member1",
              password_confirmation: "member1")
member.build_profile_member
member.profile_member.name = Faker::Name.first_name
member.profile_member.surname = Faker::Name.last_name

member.save!              
puts "MEMBRO PADRÃO cadastrado com sucesso !"

###############################################################

puts "Cadastrando ADMINISTRADOR PADRÃO..."
Admin.create!(name: "Administrador",
              email: "admin@admin.com",
              password: "admin1",
              password_confirmation: "admin1",
              role: 0)
puts "ADMINISTRADOR PADRÃO cadastrado com sucesso !"

###############################################################
