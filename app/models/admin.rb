class Admin < ApplicationRecord
  # Constrantes:
  ROLES = {:full_access => 0, :restricted_access => 1}

  #ENUMs:
  #enum role: [:full_access, :restricted_access]
  #enum role: {:full_access => 0, :restricted_access => 1} 
  enum role: ROLES

  #Scopes:
  scope :with_full_access, -> { where(role: ROLES[:full_access]) }
  scope :with_restricted_access, -> { where(role: ROLES[:restricted_access]) }
  #scope :with_restricted_access, -> { where(role: 1) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  
  def role_br
    if self.role == 'full_access'
      'Acesso Completo'
    else
      'Acesso Restrito'
    end
  end
end
