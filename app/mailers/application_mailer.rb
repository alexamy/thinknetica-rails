class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <alexamy.test.guru@gmail.com>}
  layout 'mailer'
end
