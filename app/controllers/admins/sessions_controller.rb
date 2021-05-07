class Admins::SessionsController < Devise::SessionsController
    
    protected

    def after_sign_in_path_for(resource)
        backoffice_admins_path
    end

end