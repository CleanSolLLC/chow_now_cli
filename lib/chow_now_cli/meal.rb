class ChowNowCli::Meal

# 1. Instantiate object based on meal category that is passed in from scraper
# and create methods 

  attr_accessor :title, :rating, :description, :prep_time, :cook_time, :url, :category_url
  attr_accessor :directions, :reviews, :ingredients, :scraper, :total_time, :category 
  
 
  @@all_meals = []
  # @@all_meals will hold the values of all instances of meals created by category.
  
  def initialize
    save_recipes
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
  
   
    def self.recipe_scraped?(url)
      if all_recipes.empty?
        return false
      elsif find_scraped_recipes(url)
        return true
      else
        return false
      end
    end


    def self.find_scraped_recipes(url)
      all_recipes.collect do |meal|
      meal.category_url == url
      meal
     end
    
    end

end

