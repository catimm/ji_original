class UserMailer < ActionMailer::Base

  def mandrill_client
    @mandrill_client ||= Mandrill::API.new ENV['MANDRILL_APIKEY']
  end
  
  def invite_email(invited, inviter, description)
    url = root_url+"users/invitation/accept?invitation_token="
    Rails.logger.debug("Raw token is: #{url.inspect}")
    template_name = "invitation-email"
    template_content = []
    message = {
      to: [{email: invited.email}],
      inline_css: true,
      merge_vars: [
        {rcpt: invited.email,
         vars: [
           {name: "invited", content: invited.first_name},
           {name: "inviter", content: inviter.first_name},
           {name: "inviter_email", content: inviter.email},
           {name: "link", content: url},
           {name: "token", content: invited.raw_invitation_token},
           {name: "description", content: description}
         ]}
      ]
    }
    mandrill_client.messages.send_template template_name, template_content, message
  end
  
  def welcome_email(user)
    Rails.logger.debug("User info is: #{user.inspect}")
    url = root_url+"users/"
    template_name = "welcome-email"
    template_content = []
    message = {
      to: [{email: user.email}],
      inline_css: true,
      merge_vars: [
        {rcpt: user.email,
         vars: [
           {name: "user", content: user.first_name},
           {name: "link", content: url},
           {name: "id", content: user.id}
         ]}
      ]
    }
    mandrill_client.messages.send_template template_name, template_content, message
  end  
end
