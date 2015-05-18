require 'mail'

class EmailTestJob < ActiveJob::Base
  queue_as :default

  def perform(email_test)
    send_email!(email_test)
  end

  private

    def send_email!(email_test)
      return true if email_test.sent?

      mail = Mail.new do
        from    'ash@the-rebellion.net'
        to      email_test.email
        subject 'Email from Rails stack built using Percheron'
        body    'Hooray!'
      end

      mail.delivery_method :smtp, address: "postfix", port: 25, enable_starttls_auto: false
      mail.deliver

      email_test.update(sent: true)
    end
end
