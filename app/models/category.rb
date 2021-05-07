class Category < ApplicationRecord
    #Gem Friendly Id
    include FriendlyId
    friendly_id :description, use: :slugged

    has_many :ads
    
    validates_presence_of :description

    scope :order_by_description, -> { order(:description) }

end
