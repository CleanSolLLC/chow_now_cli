class ChowNowCli::Cli

  
  attr_accessor :scraper, :value, :meal, :selection, :scraped_urls

    @scraped_urls = []
  
  
    def call
      clear_screen
      title = "Welcome to the Chow Now CLI"
      puts
      puts title.rjust(30)
      puts
      main_menu
    end


    def main_menu 
      @recipe_categories = ["Beef", "Chicken", "Seafood", "Pork", "Turkey", "Vegetarian", "Vegan"]

        @recipe_categories.each_with_index do |category, index|
          
          puts "   #{index + 1}." "   #{category}"

      end
        puts
        puts "Please enter a number between '1' and '7' for meal type <or> 'x' to exit"
          

        
        puts

        get_user_input
        
    end
    
    def get_user_input
      value = nil
      value = gets.chomp
      index = value.to_i - 1

      #pull category for use as a header
      @food_category = @recipe_categories[index]
      
          selection = validate_category_num(value)
          
          if selection && !ChowNowCli::Meal.recipe_scraped?
            ChowNowCli::Scraper.new(selection)
            scraped_meals = ChowNowCli::Meal.find_scraped_recipes(selection)
            print_meals(scraped_meals)

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
    
    def print_meals(scraped_meals)

      clear_screen
      table_array=[]
      table = nil

        table = Text::Table.new
        table.head = ["Number", "#{@food_category} Recipes", "Reviews", "Out of 5 Stars", "Prep Time", "Cook Time", "Total Time"]
         
        scraped_meals.each_with_index do |recipe, index|

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
        @table = table.to_s
        puts table.to_s

        puts
        puts "Enter menu number <or> 'x' to exit <or> 'm' for main menu"
        
        option = gets.chomp
        validate_table_input (option, scraped_meals)

    end      
    
    def validate_table_input (option, scraped_meals)
      
      max_num = (scraped_meals.length).to_i
      min_num = 1
    
      if option.to_i.between?(min_num, max_num)
      
        scraped_meals.each_with_index do |recipe, index|
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
                get_menu_selection_for_table
        end
        #view_additional_recipes
      end
      
    def view_additional_recipes
       input = nil
       puts "Would you like to view additional #{@food_category} recipes enter 'y' yes <or> 'n' no "
        input = gets.chomp
        
        if input == "Y" || input == "y"
          puts @table
          puts "Enter menu number <or> 'x' to exit <or> 'm' for main menu"
          get_menu_selection_for_table     
          
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




