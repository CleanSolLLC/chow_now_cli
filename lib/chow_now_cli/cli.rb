class ChowNowCli::Cli

  
  attr_accessor :scraper, :value, :meal, :selection
  
    def call
      clear_screen
      title = "Welcome to the Chow Now CLI"
      puts
      puts title.rjust(30)
      puts
      main_menu
      get_user_input
    end


    def main_menu 
      @recipe_categories = ["Beef", "Pasta", "Seafood", "Pork", "Turkey", "Vegetarian", "Vegan"]

      @max_num = (@recipe_categories.length).to_i
      @min_num = 1

        @recipe_categories.each_with_index do |category, index|
          
          puts "   #{index + 1}." "   #{category}"

      end
        puts
        puts "Please enter a number between #{@min_num} and #{@max_num} for meal type <or> 'x' to exit"
        puts

        #get_user_input
        
    end
    
    def get_user_input
      value = nil
      value = gets.chomp
      index = value.to_i - 1

      #pull category for use as a header in the table output
      
          selection = validate_category_num(value)

          food_category = selection.split("/")[-1].capitalize
          @food_category = food_category
        
              if selection && ChowNowCli::Meal.recipes_not_scraped? || selection && !ChowNowCli::Meal.recipes_exist?(food_category)
                ChowNowCli::Scraper.new(selection)
                @scraped_meals = ChowNowCli::Meal.find_scraped_recipes(food_category)
                print_meals

             else
                 selection && ChowNowCli::Meal.recipes_exist?(selection)
                 @scraped_meals = ChowNowCli::Meal.find_scraped_recipes(food_category)
                 print_meals
             end

      end
      

     def validate_category_num (value)
    
        case value
      
      
        when "1"
           return  "https://www.allrecipes.com/recipes/200/meat-and-poultry/beef/"    
          
        when "2" 
            return  "https://www.allrecipes.com/recipes/95/pasta-and-noodles/"
          
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
            puts "#{value} is not a valid option."
            puts "Please enter a number between #{@min_num} and #{@max_num} for meal type <or> 'x' to exit"
            get_user_input
        end
    
      
    end
    
    def print_meals
      clear_screen
      table_array=[]
      table = nil

        table = Text::Table.new
        table.head = ["Number", "#{@food_category} Recipes", "Reviews", "5 Stars", "Prep Time", "Cook Time", "Total Time"]
      
        @scraped_meals.each_with_index do |recipe, index|
  
            table_array = "#{index + 1}" ". ",  "#{"%-45s" % recipe.title.slice(0,45)}","#{recipe.reviews}","#{recipe.rating}", "#{recipe.prep_time}", "#{recipe.cook_time}", "#{recipe.total_time}"
        
            table.rows << table_array
             
        end
        @table = table.to_s
        puts table.to_s

        puts
        puts "Enter menu number <or> 'x' to exit <or> 'm' for main menu"
        
        option = gets.chomp
        validate_table_input(option)

    end      
    
    def validate_table_input(option)
    
      max_num = (@scraped_meals.length).to_i
      min_num = 1
    
      if option.to_i.between?(min_num, max_num)
      
        @scraped_meals.each_with_index do |recipe, index|
          if index == option.to_i-1
    
            print_recipe_details(recipe)
            view_additional_recipes
    
            end
          end
        
            
      elsif
          option == 'X' || option == 'x'
          end_program
              
              elsif 
                  option == 'M' || option == 'm'

                    #ChowNowCli::Meal.save_scraped_recipes  
                    clear_screen
                    call
    

                  
                else
                  puts "#{option}" " is not a valid option. Enter a value between " "#{min_num}" " and" " #{max_num}:"  
                puts "<or>" " enter 'm' to go back to main menu: " "<or>" " enter 'x' to end the program:"
                option = gets.chomp
                validate_table_input(option)
        end
        #view_additional_recipes
    end
      
    def view_additional_recipes

       input = nil
       puts "Would you like to view additional #{@food_category} recipes enter 'y' yes <or> 'n' no "
        input = gets.chomp
        
        if input == "Y" || input == "y"
          clear_screen
          puts @table
          puts "Enter menu number <or> 'x' to exit <or> 'm' for main menu"
          input = gets.chomp
          validate_table_input(input)   
          
            elsif input == "N" ||input == "n"
              
              puts "Enter 'm' for main menu menu <or> 'x' to exit"
              input = gets.chomp

                if input == 'X' || input == 'x'
                    end_program
                
                elsif input == 'M' || input == 'm'
                    call
                else
                    puts "#{input}" " is not a valid option."
                    #binding.pry
                    view_additional_recipes
                end

            else
              puts "#{input}" " is not a valid option."
              #binding.pry
              view_additional_recipes
        end 
              
    end

    def print_recipe_details(recipe)

        clear_screen
        puts "RECIPE"
        puts recipe.title
        puts
        puts "DESCRIPTION"
        puts recipe.description
        puts

        puts "INGREDIENTS"
        recipe.ingredients.reject{|a| a == "Add all ingredients to list"}.map{|ing| puts "#{ing}"}.reject  

        puts

        puts "DIRECTIONS"
        recipe.directions.reject{|b| b == "Watch Now"}.map{|dir| puts "#{dir}"}
        puts

    end

    def clear_screen
      system('clear')
    end

    def end_program
      
       puts "Thank you for using the Chow Now CLI!"
       !exit
    end
end