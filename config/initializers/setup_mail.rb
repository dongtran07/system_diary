ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "noreply.systemlog@gmail.com",
  :password             => "12121990pppp",
  :authentication       => "plain",
  :enable_starttls_auto => true
}