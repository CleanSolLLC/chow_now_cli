class ChowNowCli::Cli

  
  attr_accessor :scraper, :value, :meal, :selection, :scraper

     def call
      clear_screen
      title = "Welcome to the Chow Now CLI"
      puts
      puts title.rjust(30)
      puts
      scraper = ChowNowCli::Scraper.new
      site_url = "https://www.allrecipes.com/recipes/"
      ChowNowCli::Scraper.get_scraped_categories(site_url)
      main_menu
    end


    def main_menu 
       ChowNowCli::Scraper.scraped_categories.each_with_index do |category, index|
        binding.pry
           puts "   #{index + 1}." "  #{category.text}".strip 
      end
      prompt_user
    end

    def prompt_user

      max_num = (ChowNowCli::Scraper.scraped_categories.length).to_i
      min_num = 1

      puts
      puts "Please enter a number between #{min_num} and #{max_num} for meal type <or> 'x' to exit"
      puts

      option = nil
      option = gets.chomp
     
      if (option.to_i.between?(min_num, max_num))

        selection = ChowNowCli::Scraper.scraped_categories[option.to_i-1].css("a").attr("href").value
        @food_category = selection.split("/")[-1].capitalize
        #@food_category = food_category
        
              if ChowNowCli::Meal.recipes_not_scraped? || !ChowNowCli::Meal.recipes_exist?(selection)
                ChowNowCli::Scraper.get_recipes(selection)
                scraped_meals = ChowNowCli::Meal.find_scraped_recipes(selection)
                @scraped_meals = ChowNowCli::Scraper.second_scrape(scraped_meals)
                print_meals

             else
                 ChowNowCli::Meal.recipes_exist?(selection)
                 @scraped_meals = ChowNowCli::Meal.find_scraped_recipes(selection)
                 print_meals
             end


      elsif option == 'X' || option == 'x'
            end_program

      else puts "#{option}" " is not a valid option. Enter a value between " "#{min_num}" " and" " #{max_num}"
           prompt_user
          
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
        #recipe = @scraped_meals[option.to_i-1]

          #ChowNowCli::Scraper.second_scrape(recipe)
          
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
                    main_menu
                  
                else
                  puts "#{option}" " is not a valid option. Enter a value between " "#{min_num}" " and" " #{max_num}:"  
                  puts "<or>" " enter 'm' to go back to main menu: " "<or>" " enter 'x' to end the program:"
                  option = gets.chomp
                 
                  validate_table_input(option)
        end
  
    end
      
    def view_additional_recipes

       input = nil
       puts "Would you like to view additional #{@food_category} recipes enter 'y' yes <or> 'n' no "

        input = gets.chomp
        
        if input == "Y" || input == "y"
          clear_screen
          puts @table
          puts "Enter menu number <or> 'x' to exit <or> 'm' for main menu"
          input = nil
          input = gets.chomp
         
          validate_table_input(input)   
          
        elsif input == "N" ||input == "n"
              
            puts "Enter 'm' for main menu menu <or> 'x' to exit"
            input = gets.chomp

                if input == 'X' || input == 'x'
                    end_program
                
                elsif input == 'M' || input == 'm'
                    main_menu 
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
        recipe.ingredients.reject{|a| a == "Add all ingredients to list"}.map{|ing| puts "#{ing}"}

        puts

        puts "DIRECTIONS"
        recipe.directions.reject{|b| b == "Watch Now"}.map{|dir| puts "#{dir}"}
                
    end

    def clear_screen
      system('clear')
    end

    def end_program
      
       puts "Thank you for using the Chow Now CLI!"
       !exit
    end
end