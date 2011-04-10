ActionMailer::Base.smtp_settings = {
  :address                => 'smtp.gmail.com',
  :port                   => 587,
  :user_name              => 'no-reply@pieceofthefuture.org',
  :password               => 'Pcfthftr1',
  :authentication         => 'plain',
  :enable_starttls_auto   => true
}