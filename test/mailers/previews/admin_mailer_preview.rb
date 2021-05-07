class AdminMailerPreview < ActionMailer::Preview
    def update_email
        AdminMailer.update_email(Admin.first, Admin.last)
    end

    def send_mail
        AdminMailer.send_mail(Admin.first.email, Admin.first.email, "Subject Test","Mensagem....")
    end    
end