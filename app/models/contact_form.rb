class ContactForm < MailForm::Base
  attribute :name,      :validate => true
  #attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :contact,   :validate => true     

  attribute :message#, :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "izmedi.ru - письмо с сайта",
      :to => "hs88@mail.ru",
      :from => %("Измеди.ру" <@info@izmedi.ru>)
    }
  end
end