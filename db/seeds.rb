require 'faker'

Card.destroy_all
Category.destroy_all
User.destroy_all

user = User.create(email: "user@mail.com",password: "password")

Ruby = Category.create(name: "Ruby",user_id: user.id)

10.times do 
    Card.create(question: Faker::Quote.famous_last_words ,answer: Faker::Quote.yoda,category_id: Ruby.id,user_id: user.id )
end

