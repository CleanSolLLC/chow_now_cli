class ChowNowCli::Scraper 



 	#this first scrape will pass in url from the Cli class based on a meal type
 	#i.e beef, chicken, fish, etc. 

 	#the url will be set to the first page which has approx 29 meals per page.
 	#additional future logic provided o scrape multiple pages of the 
 	#same meal category

 	def self.get_scraped_categories(site_url)
 	
   		@@scraped_categories = []

  #  	i=0

		# while i  < 1
			
			#url << "?page=""#{i}"
			#url = @url 
			html = open(site_url)
				
			if html == OpenURI::HTTPError
				#will use additional error handling later
				puts "error messege" 
			else
				@doc = Nokogiri::HTML(html)

				   	@doc.css(".all-categories-col li").each do |category|
   					@@scraped_categories << category unless category.text == "All Trusted Brands"
					#last element of array not scrapable		
   					end
   			end

   	end

	def self.scraped_categories
		@@scraped_categories
	end

	def self.get_recipes(url)

		i = 0

		@doc = Nokogiri::HTML(open(url))

		@doc.css("article.fixed-recipe-card").each do |name|

		name.css(".fixed-recipe-card__info").each do |recipe|
		
		puts "performing first scrape"
		
		meal = ChowNowCli::Meal.new
		meal.category_url = url
		meal.category = url.split("/")[-2].capitalize
		meal.title = recipe.css(".fixed-recipe-card__h3").text.strip	
		meal.description = recipe.css("div.fixed-recipe-card__description").text
		meal_url = recipe.css("a").attr("href").value
		meal.url = meal_url
		puts "#{url}"

		end		
		end
	end

	def self.second_scrape(recipes)
		i=0
		recipes.each do |meal|
		@doc2 = Nokogiri::HTML(open(meal.url))
		puts "performing second scrape"
		time_array = []
		ingredients_array = []
			directions_array = []

		meal.rating = @doc2.css(".rating-stars//@data-ratingstars").text.strip
		@doc2.css(".recipe-directions__list--item").collect do |dir|
			directions_array << dir.text.strip
			end
		meal.directions = directions_array
		meal.reviews = @doc2.css(".review-count").text.strip
		@doc2.css(".checkList__line").collect do |list| 
			ingredients_array << list.text.strip
			end
		meal.ingredients = ingredients_array

		@doc2.css(".prepTime__item").collect do |time|
			time_array << time.values[1]
			end
			meal.prep_time = time_array[1]
			meal.cook_time = time_array[2]
			meal.total_time = time_array[3]

			#handles the formatting of columns for use in ChowNowCli::Cli.print_meals

        meal.prep_time = meal.prep_time.slice(10..).strip if meal.prep_time != nil || meal.prep_time == ""
        meal.cook_time = meal.cook_time.slice(10..).strip if meal.cook_time != nil || meal.cook_time == ""
        meal.rating = meal.rating.slice(0,4).strip if meal.rating != nil || meal.rating == ""

        meal.reviews = "0 reviews" if meal.reviews == nil || meal.reviews == ""
        meal.rating  = "0" if meal.rating == nil || meal.rating == ""
        
        meal.prep_time = "****"  if meal.prep_time == nil  || meal.prep_time == ""
        meal.cook_time = "****"  if meal.cook_time == nil  || meal.cook_time == ""
        meal.total_time = "****" if meal.total_time == nil || meal.total_time == ""
		
		puts "#{meal.url}" "#{i}"
		i+=1
	end
	end
end