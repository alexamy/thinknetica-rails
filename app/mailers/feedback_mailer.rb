class FeedbackMailer < ApplicationMailer
  def feedback(feedback)
    @email = feedback.email
    @body = feedback.body

    mail to: 'alexamy.test.guru@gmail.com', subject: 'Обратная связь'
  end
end
