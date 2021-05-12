class Site::HomeController < SiteController
  
  def index
    TailsWorker.perform_async("Rafa")

    cookies[:app_name] = "Rosazul"
    cookies[:Novoteste] = { value: "Teste", expires: 1.hour.from_now}

   # if cookies[:categories] 
   #   @categories = eval(cookies[:categories])
   # else      
      @categories = Category.order_by_description
   # end

    @ads = Ad.descending_order(params[:page])
    @carousel = Ad.random(3)

    cookies[:categories] = @categories.to_json
    #puts ">>>>>>>>>>>>> user_name: #{eval(cookies[:categories])}"
    #puts ">>>>>>>>>>>>> Novoteste: #{cookies[:Novoteste]}"
  end
end
