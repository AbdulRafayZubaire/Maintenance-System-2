class UserMailer < ApplicationMailer
  default from: 'abdurrafaykhawer20@gmail.com'

  def welcome_email
    @url  = 'http://example.com/login'
    @user = params[:user]
    # binding.pry
    puts "inside mailer method"
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
