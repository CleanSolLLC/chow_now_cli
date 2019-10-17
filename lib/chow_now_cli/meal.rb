class ChowNowCli::Meal

# 1. Instantiate object based on meal category that is passed in from scraper
# and create methods 

  attr_accessor :title, :rating, :description, :prep_time, :cook_time, :url, :category_url
  attr_accessor :directions, :reviews, :ingredients, :scraper, :total_time, :category 
  
 
  @@all_meals = []
  @@page_urls = []

  # @@all_meals will hold the values of all instances of meals created by category.
  
    def initialize(url)
     @@all_meals << self
     @@page_urls << url
    end

    def self.all_category_urls
      @@page_urls.uniq
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


    def self.find_scraped_recipes(url)
      all_recipes.find_all do |recipe|
      recipe.category_url == url
      recipe
    end
    
    end

    def self.recipes_exist?(url)
      all_recipes.find do|recipe|
      recipe.category_url[0...-7].include?(url)
    end
    
    end


end

