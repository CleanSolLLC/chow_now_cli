class ChowNowCli::Cli

  
  attr_accessor :scraper, :value, :meal, :selection, :scraped_urls

    @scraped_urls = []
  
  
    def call
      title = "Welcome to the Chow Now CLI"
      puts
      puts title.rjust(10)
      puts
      main_menu
    end


    def main_menu 
      @recipe_categories = ["Beef", "Chicken", "Seafood", "Pork", "Turkey", "Vegetarian", "Vegan"]

        @recipe_categories.each_with_index do |category, index|
          
          puts "#{index + 1}." " #{category}"

      end
        puts
        puts "Please enter a number between '1' and '7' for meal type <or> 'x' to exit"
          

        
        puts

        get_user_input
        
    end
    

    def get_user_input
      value = gets.chomp
      index = value.to_i - 1

      #pull category for use as a header
      food_category = @recipe_categories[index]
      
          selection = validate_category_num(value)
          
          if selection #&& !Meal.recipe_scraped?
            ChowNowCli::Scraper.new(selection)
            print_meals(food_category)

          #elsif 
            # Meal.scraped_recipes.empty?
            # print_meals(food_category)

          else
            get_user_input
          end
          
    end
      

     def validate_category_num (value)
    
        case value
      
      
        when "1"
           return  "https://www.allrecipes.com/recipes/200/meat-and-poultry/beef/"    
          
        when "2" 
            return "https://www.allrecipes.com/recipes/201/meat-and-poultry/chicken/"
          
        when "3"
            return "https://www.allrecipes.com/recipes/93/seafood/"
             
        when "4" 
            return "https://www.allrecipes.com/recipes/205/meat-and-poultry/pork/"
            
        when "5" 
            return "https://www.allrecipes.com/recipes/206/meat-and-poultry/turkey/"

        when "6" 
            return "https://www.allrecipes.com/recipes/87/everyday-cooking/vegetarian/"

        when "7" 
            return "https://www.allrecipes.com/recipes/1227/everyday-cooking/vegan/"
          
        when "x", "X"  
        
           end_program


        else  
            puts "#{value} is not a valid option, enter a value betwen 1 and 7" "<or> enter 'x' to end the program"
        end
 
      
    end
    
    def print_meals(food_category)

      table_array=[]

      puts "\e[H\e[2J"


        table = Text::Table.new
        table.head = ["Number", "#{food_category} Recipes", "Reviews", "Out of 5 Stars", "Prep Time", "Cook Time", "Total Time"]
         
        ChowNowCli::Meal.all_recipes.each_with_index do |recipe, index|

            #handles the formatting of columns

            recipe.prep_time = recipe.prep_time.slice(10..).strip if recipe.prep_time != nil || recipe.prep_time == ""
            recipe.cook_time = recipe.cook_time.slice(10..).strip if recipe.cook_time != nil || recipe.cook_time == ""
            recipe.rating = recipe.rating.slice(0,4).strip if recipe.rating != nil || recipe.rating == ""

            recipe.reviews = "0 reviews" if recipe.reviews == nil || recipe.reviews == ""
            recipe.rating  = "0" if recipe.rating == nil || recipe.rating == ""
            
            recipe.prep_time = "****"  if recipe.prep_time == nil  || recipe.prep_time == ""
            recipe.cook_time = "****"  if recipe.cook_time == nil  || recipe.cook_time == ""
            recipe.total_time = "****" if recipe.total_time == nil || recipe.total_time == ""




            table_array = "#{index + 1}" ". ",  "#{"%-45s" % recipe.title.slice(0,45)}","#{recipe.reviews}","#{recipe.rating}", "#{recipe.prep_time}", "#{recipe.cook_time}", "#{recipe.total_time}"
        
            table.rows << table_array
             
        end

        puts table.to_s
      
        puts
        puts "Enter menu number <or> 'x' to exit <or> 'm' for main menu"
        
        get_menu_selection
      
    end
    
     def get_menu_selection
      
      option = gets.chomp
      validate_input (option)
      
    end
    
    def validate_input (option)
      
      max_num = (ChowNowCli::Meal.all_recipes.length).to_i
      min_num = 1
    
      if option.to_i.between?(min_num, max_num)
      
        ChowNowCli::Meal.all_recipes.each_with_index do |recipe, index|
          if index == option.to_i-1
    
            print_recipe_details(recipe)
    
          end
          end
        
            
      elsif
          option == 'X' || option == 'x'
          end_program
              
              elsif 
                  option == 'M' || option == 'm'
                    
                    main_menu
                  
                else
                  puts "#{option}" " is not a valid option. Enter a value between " "#{min_num}" " and" " #{max_num}:"  
                puts "<or>" " enter 'm' to go back to main menu: " "<or>" " enter 'x' to end the program:"
                get_menu_selection
        end
        view_additional_recipes
      end
      
    def view_additional_recipes
     input = nil
     puts "Would you like to view additional #{@food_type} recipes enter 'y' yes <or> 'n' no "
      
      input = gets.chomp
      
      if input == "Y" || input == "y"
        print_meals(recipe)
        
        # #1. save the contents of previous selection to a saved array
        # #to prevent rescraping  
        # ChowNowCli::Meal.save_scraped_recipes
        
        # main_menu
        
          elsif input == "N" ||input == "n"
            end_program
        
          else
            puts "#{input}" " is not a valid option."
            view_additional_recipes
        end
        
      end

    def print_recipe_details(recipe)

        @food_type = recipe.category

        puts
        puts "DESCRIPTION"
        puts recipe.description
        puts

        puts "INGREDIENTS"
        recipe.ingredients.reject{|a| a == "Add all ingredients to list"}.map{|ing| puts "#{ing}"}.reject  

        puts

        puts "DIRECTIONS"
        recipe.directions.select{|dir| puts "#{dir}"}
        puts



    end
    
    def end_program
      
       puts "Thank you for using the Chow Now CLI!"
       !exit
    end
end




