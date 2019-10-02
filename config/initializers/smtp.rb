ActionMailer::Base.smtp_settings = {
    domain: 'http://reddit-ruby.herokuapp.com/',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       ENV['SENDGRID_API_KEY']
  }