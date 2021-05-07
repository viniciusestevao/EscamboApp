namespace :dev do

 ##############################################################
  desc "Setup Development"
  task setup: :environment do
    images_path = Rails.root.join('public','system')

    puts "Executando setup para desenvolvimento..."

    puts "APAGANDO BD...#{%x(rake db:drop)}"
    puts "Apagando imagens de public/system #{%x(rm -rf #{images_path})}"
    puts "CRIANDO BD...#{%x(rake db:create)}"
    %x(rake db:migrate)
    %x(rake db:seed)
    %x(rake dev:generate_admins)
    %x(rake dev:generate_members)
    %x(rake dev:generate_ads)
    %x(rake dev:generate_comments)

    puts "Setup concluído com sucesso!"
  end
##############################################################
  desc "Cria Administradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando ADMINISTRADORES PADRÃO..."

    10.times do
        Admin.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: "admin1",
          password_confirmation: "admin1",
          role: [0,1,1].sample)
    end

    puts "ADMINISTRADORES PADRÃO cadastrados com sucesso!"
  end
##############################################################
  desc "Cria Membros Fake"
  task generate_members: :environment do
    puts "Cadastrando MEMBROS..."

    10.times do
      member = Member.new(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
      member.build_profile_member
      member.profile_member.name = Faker::Name.first_name
      member.profile_member.surname = Faker::Name.last_name

      member.save!
    end
    
    puts "MEMBROS cadastrados com sucesso!"
  end

##############################################################
  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."

    16.times do
        Ad.create!(
          title: Faker::Lorem.sentence(word_count: [2,3,4,5].sample),
          description_md: markdown_fake,   # DoctorIpsum::Markdown.entry,
          description_short: Faker::Lorem.sentence(word_count: [4,5,6,7,8,9,10].sample),
          member: Member.all.sample,
          category: Category.all.sample,
          price: "#{Random.rand(500)},#{Random.rand(99)}",
          finish_date: Date.today + Random.rand(90),
          picture: File.new(Rails.root.join('public','templates','images-for-ads',"#{Random.rand(8)}.jpg"),'r')
        )
    end

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence(word_count: [2,3,4,5].sample),
        description_md: markdown_fake,   # DoctorIpsum::Markdown.entry,
        description_short: Faker::Lorem.sentence(word_count: [4,5,6,7,8,9,10].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public','templates','images-for-ads',"#{Random.rand(8)}.jpg"),'r')
      )
    end

    puts "ANÚNCIOS cadastrados com sucesso!"
  end

  def markdown_fake
    %x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry")
  end

##############################################################
  desc "Cria Comentários Fake"
  task generate_comments: :environment do
    puts "Cadastrando COMENTÁRIOS..."

    Ad.all.each do |a|
      ([1,2,3].sample).times do
        #puts "mostrando: " + a.to_s
        Comment.create!(
          body: Faker::Lorem.paragraph([1,2,3].sample),
          member: Member.all.sample,
          ad: a)
      end
    end

    puts "COMENTÁRIOS cadastrados com sucesso!"
  end

##############################################################
end
