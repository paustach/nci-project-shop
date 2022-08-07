class ContactForm < MailForm::Base
    attribute :name, validate: true
    attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  
    attribute :message,  validate: true
    attribute :nickname, captcha: true
  
    # Declare the e-mail headers. It accepts anything the mail method
    # in ActionMailer accepts.
    def headers
      {
        subject: "The Neat Need Contact Form",
        to: "neatneedproject@gmail.com",
        from: %("#{name}" <#{email}>)
      }
    end
end