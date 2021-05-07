class ProfileMember < ApplicationRecord
    belongs_to :member

    def full_name
        "#{self.name} #{self.surname}"
    end

end
