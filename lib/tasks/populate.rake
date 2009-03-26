namespace :db do
  desc "Erase and fill DB"
  task :populate => :environment do
    require 'populator'


    User.populate 50 do |user|
      user.login = Populator.words(1).downcase
      user.email = "fake@example.com"

      Book.populate 1..20 do |book|
        book.user_id = user.id
        book.title = Populator.words(1..3).titleize
        book.description = Populator.sentences(2..10)
        book.price = [10, 20, 24.99, 30, 50, 100]
        book.created_at = 2.years.ago..Time.now
      end
    end
  end
end
