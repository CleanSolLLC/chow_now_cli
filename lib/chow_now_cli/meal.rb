class ChowNowCli::Meal

# 1. Instantiate object based on meal category that is passed in from scraper
# and create methods 

  attr_accessor :title, :rating, :description, :recipe_url, :prep_time, :cook_time, :recipe_url, :url
  attr_accessor :directions, :reviews, :ingredients, :scraper, :total_time, :category, :category_url
  
  @@scraped_meals = []
  # will hold all recipes that have been scraped
  
  @@all_meals = []
  # @@all_meals will hold the values of all instances of meals created by category.

  @@urls = []
  
  def initialize#(url)
    #url is used to see if there is an instance to prevent rescraping 
    self.save_meal
    #self.load_url(url)
  end
    
    def save_meal
      @@all_meals << self
    end

    def self.all_recipes
      @@all_meals
    end
    
    def self.delete_recipes
       @@all_meals.clear
    end
  
    # def self.save_recipes_by_category(recipe)
    #   @meal << recipe
    # end
    
    def self.save_scraped_recipes
       @@scraped_meals << @@all_meals   
       #delete @@all_meals to create new scrape if necessary
       delete_recipes
    end
    
    def self.scraped_recipes
      @@scraped_meals
    end

    # def self.recipe_scraped?(url)
    #   self.class.scraped_recipes.empty? ||  
  
    # # def self.recipes_by_category
    # #  @meal
    # # end

    def self.load_url(url)
      @@urls << url
    end

end

