require 'faker'

Card.destroy_all
Category.destroy_all
User.destroy_all


5.times do
    Category.create(name: Faker::Lorem.word)
end

10.times do 
    Card.create(question: Faker::Quote.famous_last_words ,answer: Faker::Quote.yoda )
end

user = User.create(email: "user@mail.com",password: "password")