class Notification < ActionMailer::Base
  default from: "from@example.com"

  def send_confirmation_mail(obj)
  	@store = obj
    # @url  = 'http://example.com/login'
    mail(to: @store.email, subject: 'Confirmation mail')
  end

  def send_store_confirmation(obj)

    @store = store
    # @url  = 'http://example.com/login'
    mail(to: ADMIN_EMAIL, subject: 'Store Confirmation')
  end
end
