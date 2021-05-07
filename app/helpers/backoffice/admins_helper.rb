module Backoffice::AdminsHelper
    OptionsForRoles = Struct.new(:id, :description)

    def options_for_roles
        #options = []
        #Admin.roles_i18n.each do |key, value|
        #    options.push(OptionsForRoles.new(key, value))
        #end
        #options

        #Admin.roles_i18n.map { |key, value| options.push(OptionsForRoles.new(key, value)) }
        Admin.roles_i18n.map do |key, value|
            OptionsForRoles.new(key, value)
        end
    end
end
