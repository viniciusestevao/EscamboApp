class Member < ApplicationRecord
  # RatyRate Gem
  ratyrate_rater
  
  # Associations
  has_many :ads
  has_one :profile_member
  has_one :order
  accepts_nested_attributes_for :profile_member

  # Validations
  validate :nested_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  def nested_attributes
    if nested_attributes_blank?
      errors.add(:base, "É necessário preencher os campos Nome e Sobrenome")
    end
  end

  def nested_attributes_blank?
    profile_member.name.blank? || profile_member.surname.blank?
  end
end
