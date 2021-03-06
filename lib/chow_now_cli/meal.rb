class ChowNowCli::Meal

# 1. Instantiate object based on meal category that is passed in from scraper
# and create methods 

  attr_accessor :title, :rating, :description, :prep_time, :cook_time, :url, :category_url
  attr_accessor :directions, :reviews, :ingredients, :scraper, :total_time, :category 
  
 
  @@all_meals = []
  @@recipe_array = []

  # @@all_meals will hold the values of all instances of meals created by category.
  
    def initialize
     @@all_meals << self
    end

    def self.save_recipes
      @@all_meals << self
    end

    def self.all_recipes
      @@all_meals
    end
    
    def self.delete_recipes
       @@all_meals.clear
    end
  
    def self.recipes_not_scraped?
      all_recipes.empty?
    end

    def self.find_scraped_recipes(selection)
      all_recipes.find_all do |recipe|
      recipe.category_url == selection
      #food_category could be changed later to pass in url to accomodate scraping 
      #multiple pages of the same category. 
     end
    end

    def self.recipes_exist?(selection)
      all_recipes.find do|recipe|
      recipe.category_url == selection || recipe.url == selection ? true : false
      #food_category could be changed later to url to accomodate scraping 
      #multiple pages of the same category. 
    end
    
    end


end

