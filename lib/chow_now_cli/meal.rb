class ChowNowCli::Meal

# 1. Instantiate object based on meal category that is passed in from scraper
# and create methods 



  attr_accessor :title, :rating, :description, :url, :prep_time, :cook_time
  attr_accessor :directions, :reviews, :ingredients, :scraper, :total_time, :category
  
  @meal = []
  # @@meal wil hold instances of meals
  
  @@all_meals = []
  # @@all_meals will hold the values of all instances of meals created by category. This is the class vairable that will
  # hold instances to regenerate menus and to check to see if a categoiry already exists to prevent rescraping data
  #it holds the array @@meal which are each instances of a meal
  

  def initialize
    self.save_meal
  end
    
    def save_meal
      @@all_meals << self
    end

    def self.all_recipes
      @@all_meals
    end
    
    # # def self.delete_recipes
    # #   @meal.clear
    # # end
  
    # def self.save_recipes_by_category(recipe)
    #   @meal << recipe
    # end
    
    # def self.save_scraped_recipes(meal)
    #    @scraped_recipes << meal
    #  end
    
    # # def self.scraped_recipes
    # #   @scraped_recipes
    # # end
  
    # def self.recipes_by_category
    #  @meal
    # end

end

