class ChowNowCli::Scraper 

	def initialize(url)

 	#this first scrape will pass in url from the Cli class based on a meal type
 	#i.e beef, chicken, fish, etc. 

 	#the url will be set to the first page which has approx 26 meals per page.
 	#additional logic provided to iterate to scrape multiple pages of the 
 	#same meal category not yet implemented

   	i=0

		while i  < 1
			
			url << "?page=""#{i}"
			html = open(url)
				
			if html == OpenURI::HTTPError
				#will use additional error handling later
				puts "error messege" 
			else
				@doc = Nokogiri::HTML(html)

				@doc.css("article.fixed-recipe-card").each do |name|

				name.css(".fixed-recipe-card__info").each do |recipe|
				
				puts "performing first scrape"
				
				meal = ChowNowCli::Meal.new(url)
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
		i+=1
		end
		get_second_scrape(url)
	end
			
	def get_second_scrape(url)
			i=0
			ChowNowCli::Meal.all_recipes.each do |meals|
			   if meals.url == url		
					@doc2 = Nokogiri::HTML(open(meals.url))
					puts "performing second scrape"
					time_array = []
					ingredients_array = []
  					directions_array = []

					meals.rating = @doc2.css(".rating-stars//@data-ratingstars").text.strip
					@doc2.css(".recipe-directions__list--item").collect do |dir|
					directions_array << dir.text.strip
					end
					meals.directions = directions_array
					meals.reviews = @doc2.css(".review-count").text.strip
					@doc2.css(".checkList__line").collect do |list| 
					ingredients_array << list.text.strip
					end
					meals.ingredients = ingredients_array

					@doc2.css(".prepTime__item").collect do |time|
					time_array << time.values[1]
					end
					meals.prep_time = time_array[1]
					meals.cook_time = time_array[2]
					meals.total_time = time_array[3]

					#handles the formatting of columns

		            meals.prep_time = meals.prep_time.slice(10..).strip if meals.prep_time != nil || meals.prep_time == ""
		            meals.cook_time = meals.cook_time.slice(10..).strip if meals.cook_time != nil || meals.cook_time == ""
		            meals.rating = meals.rating.slice(0,4).strip if meals.rating != nil || meals.rating == ""

		            meals.reviews = "0 reviews" if meals.reviews == nil || meals.reviews == ""
		            meals.rating  = "0" if meals.rating == nil || meals.rating == ""
		            
		            meals.prep_time = "****"  if meals.prep_time == nil  || meals.prep_time == ""
		            meals.cook_time = "****"  if meals.cook_time == nil  || meals.cook_time == ""
		            meals.total_time = "****" if meals.total_time == nil || meals.total_time == ""
						
						#time_array holds 3 sometimes 4 values including nil
						#iterate over time_array to extract prep time, cooking time and
						#total time values

					puts "#{meals.url}" "#{i}"
					i+=1
				end
				end	#goes with the second scrape
	end
end