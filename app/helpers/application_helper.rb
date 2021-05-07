module ApplicationHelper

    def current_user
        current_member
    end

    def devise_sign_in?
        params[:controller] == 'members/sessions' ? '' : 'display:none;'
    end

    def devise_sign_up?
        params[:controller] == 'members/registrations' ? '' : 'display:none;'
    end


    def md_to_html(text)
        options = {
            filter_html: true,
            link_attributes: {
            rel: "nofollow",
            target: "_blank"
            }
        }

        extensions = {
        space_after_headers: true,
        autolink: true
        }

        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)

        markdown.render(text).html_safe
    end
end
