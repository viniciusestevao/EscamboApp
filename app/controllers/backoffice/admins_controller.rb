class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    #@admins = Admin.all
    #@admins = Admin.where(role: 'full_access')
    
    #@admins = Admin.with_full_access
    #@admins = Admin.with_restricted_access

    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    #@admin = AdminService.create(params_admin)
    @admin = Admin.new(params_admin)

    admin_name = @admin.name
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O administrador (#{admin_name}) foi criado com sucesso."
    else
      render :new
    end
  end

  def edit
    # Uses before_action to set the admin
   # @admin = Admin.find(params[:id])
  end

  def update
    admin_name = @admin.name
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now #esse método para o servidor e envia um e-mail imediatamente
      redirect_to backoffice_admins_path, notice: "O administrador (#{admin_name}) foi atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    authorize @admin

    admin_name = @admin.name
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O administrador (#{admin_name}) foi excluído com sucesso."
    else
      render :index
    end
  end


  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      if password_blank?
        params[:admin]= params[:admin].except(:password, :password_confirmation)
      end
  
      if @admin.blank?
        params.require(:admin).permit([:name, :email, :password, :password_confirmation])
      else
        params.require(:admin).permit(policy(@admin).permitted_attributes)
      end
    end

    def password_blank?
      params[:admin][:password].blank? &&
      params[:admin][:password_confirmation].blank?
    end
end
