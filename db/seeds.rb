Card.destroy_all

require 'faker'

10.times do 
    Card.create(question: Faker::Quote.famous_last_words ,answer: Faker::Quote.yoda )
end