require 'test_helper'

class ReceiveCheckMailerTest < ActionMailer::TestCase
  test 'should send a receive check email' do
    user = User.create!({
      fullname: "Vitor",
      birthday: "1990-01-01",
      # birthday: Date.new(1990, 01, 01),
      user_cheking: "60",
      tolerance_days: "5",
      document_type:"ID",
      document_number: "1231456789",
      phone_number: "+551121555786",
      gender: "Male",
      post_code:"123456789",
      address: "Rua Jerico",
      city: "Sao Paulo",
      country: "Brasil",
      email:"victorsilva.git@gmail.com",
      password:"123123"
    })
    Message.create!({
      title: "Teste 1",
      message_type: "Message",
      description: "Description 1",
      ultimate_date: "2021-01-01",
      user_id: user.id
    })


    # Replace with your user fixture or create a user as needed
    # debugger
    message = user.messages.first # Replace with your message fixture or create a message as needed
    mail = ReceiveCheckMailer.receive_check_email(user.email, message)
    # debugger
    assert_emails 1 do
      mail.deliver_now
    end
    assert_equal ['victorsilva.git@gmail.com'], mail.to
    assert_equal 'Message back mailer Will4familly', mail.subject
  end
end


# (User.last.messages.first.ultimate_date - Date.today).to_f
