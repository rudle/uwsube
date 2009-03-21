class Postman < ActionMailer::Base
  def registration_confirmation(user)
    recipients user.email
    from "seanssorrell@gmail.com"
    subject "Thanks for registering"
    body :user => user
  end

  def contact_seller(message, book)
    seller = User.find(book.user_id)
    recipients seller.email
    from "webmaster@example.com"
    subject "Someone is interested in your book on UWSUBE"
    body(:message => message,:book => book, :seller => seller)
  end
end
