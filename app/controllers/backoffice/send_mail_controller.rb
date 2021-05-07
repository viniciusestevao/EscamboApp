class Backoffice::SendMailController < ApplicationController

    def edit
        @admin = Admin.find(params[:id])
        
        #render partial: 'backoffice/admins/shared/send_mail', locals: {admin1: @admin} 
        #respond_to do |format|
        #    format.html
        #end
        
        #render create
        #link_to '#', class: "btn btn-info btn-circle", data: {toggle: 'modal', target: '#sendMailModal', admin2: admin}, onclick: "changeEmailField(\'#{admin.name}\',\'#{admin.email}\');"
        #redirect_to backoffice_admins_path
    end

    def create
        begin
            #  @admin = Admin.find(1)
            #  AdminMailer.update_email(current_admin, @admin).deliver_now
            @mgs_notify = "Mensagem enviada com sucesso para (#{params[:'recipient-text']})."
            AdminMailer.send_mail(current_admin, params[:'recipient-text'],params[:'subject-text'],params[:'message-text']).deliver_now #esse método para o servidor e envia um e-mail imediatamente
        rescue
            @mgs_notify = "Não foi possivel enviar mensagem para (#{params[:'recipient-text']})."
        end
        redirect_to backoffice_admins_path, notice: @mgs_notify
    end

    def update
        
    end
end
