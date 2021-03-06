class Site::SearchController < SiteController

    def ads
        cookies[:search_term] = params[:q]

        @ads = Ad.search(params[:q], params[:page])
        @categories = Category.all
        @q = params[:q]
    end
end
