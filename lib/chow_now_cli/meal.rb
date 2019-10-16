class ChowNowCli::Meal

# 1. Instantiate object based on meal category that is passed in from scraper
# and create methods 

  attr_accessor :title, :rating, :description, :prep_time, :cook_time, :url, :category_url
  attr_accessor :directions, :reviews, :ingredients, :scraper, :total_time, :category 
  
 
  @@all_meals = []
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
  
   
    def self.recipes_scraped?(url)
      all_recipes.empty?
    end


    def self.find_scraped_recipes(url)
      all_recipes.find_all do |recipe|
      recipe.category_url == url
      recipe
     end
    
    end

    def self.recipes_exist?(url)
      all_recipes.each do|recipe|
        binding.pry
      recipe.category.include?("url")
     end
    
    end


end

