# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :sendmail
#ActionMailer::Base.smtp_settings = {
#    :address        => 'smtp.gmail.com',
#    :domain         => 'mail.google.com',
#    :port           => 587,
#    :user_name      => 'your_email@gmail.com',
#    :password       => '*****',
#    :authentication => :plain,
#    :enable_starttls_auto => true
#}
