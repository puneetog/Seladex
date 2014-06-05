class Notification < ActionMailer::Base
  default from: "from@example.com"

  def send_confirmation_mail(obj)
  	@organization = obj
    # @url  = 'http://example.com/login'
    mail(to: @organization.email, subject: 'Confirmation mail')
  end

  def send_organization_confirmation(obj)

    @organization = obj
    # @url  = 'http://example.com/login'
    mail(to: ADMIN_EMAIL, subject: 'Organization Confirmation')
  end

  def send_activation_mail(obj)
     @organization = obj
     mail(to: @organization.email, subject: 'Organization Activation')
  end

end
