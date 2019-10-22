Building Chow Now Gem
Imagine interface
Start with project structure - Google
Start with the entry point - the file run
Force that to build the CLI interface
Stub out the interface
Start making things real
Discover objects  
Program

Classes

  CLI
    Scraper
        Meal

a command line interface for AllRecipes.com
https://www.allrecipes.com/recipes/
where user types in chow_now_cli

Normally a user searches for an online recipe based on a food type i.e. beef, seafood, pasta etc. A search engine returns numerous websites and the user would select a website and search for recipes on that particular site. The user picks a recipe that looks delicious based on pictures, a description, ratings and perhaps by even reading a review or two. After finding that mouth watering recipe and waiting for the images and recipe to load (thanks to banners, pop ups and other annoying distractions that impact load time) the user clicks on the recipe and directions only to find out that she/he does not have the required amount of time to prepare the recipe! Even worse the user has the time but does not have all of the ingredients for the recipe! This CLI will eliminate those problems by providing the user with the necessary information early in the search and selection process for that tasty meal!


Prints Welcome Message

Welcome to the Chow Now CLI!

	1.Beef
	2.Pasta
	3.Seafood
	4.Pork
	5.Turkey
	6.Vegetarian
	7.Vegan

Please enter a number between 1 and 7 for meal type <'or'> 'x' to exit


<!-- make sure edge case returns invalid selection 
require user to input valid selection by prompting user for a valid menu number or exit -->



Based on menu selection i.e. user selects:
   
 # Option 1. Beef -- will return 
   
 Selection (beef) 		Reviews  	Stars	Prep Time  Cook Time 	Total Time

  1 Beef Wellington    	500 		5			30 min	   	1 hour		1hr:30 min
  2 Beef Kabobs			1075 		4		   	1 hr  		45 min		1hr:45 min
  3 Sirloin				3067		3			10 min 		30 min		0hr:40 min
  4 Meat Loaf			499			3			45 min 		2 hours		2hr:45 min
  
<!--  # Option 2. Pasta-- will return all chicken recipes same format as beef
 # Option 3. Fish 	-- will return all fish recipes same format as beef
 # Option 4. Pork 	-- will return all pork recipes same format as beef
 # Option 5. Turkey -- will return all turkey recipes same format as beef
 # Option 6. Vegetarian -- will return all vegetarian recipes same format
 # Option 7. Vegan -- will return all vegan recipes same format  -->  

 Enter a menu number, 'x' to exit the program or 'm' to go back to the main menu


<!--  #make sure edge case returns invalid selection 
 #require user to input valid selection by prompting the user for a valid menu #number or exit -->


   Beef Wellington

   <!--  Beef Wellington will return the recipe which also contains the description -->
   
	Description 

	Perfect Beef Wellington! Beef tenderloin fillet, coated with mustard, mushroom duxelles, ham, wrapped in puff pastry and baked. Based on Gordon Ramsay Beef Wellington recipe.

	Ingredients

	1 pound beef tenderloin filet
	Salt and pepper
	Extra virgin olive oil
	1 pound mushrooms (we used half cremini, half shiitake)
	4 thin slices ham (Parma ham if you can get it) or prosciutto
	2 tablespoons yellow mustard (we used Coleman's Original English Mustard)
	7 ounces puff pastry (needs 3 hours to defrost in refrigerator if using frozen)
	2 egg yolks, beaten

	Recipe

	1 Sear filet on all sides: Season the fillet generously with salt and pepper. Heat a tablespoon or two of oil in a large pan on high heat. Sear the fillet in the pan on all sides until well browned (hint: do not move the fillet until it has had a chance to brown).

	2 Brush the filet with mustard: Remove the filet from the pan and let cool. Once cooled, brush the fillet on all sides with mustard.

	3 Prepare the mushroom duxelles: Chop the mushrooms and put them into a food processor and purée. Heat the sauté pan on medium high heat. Transfer the mushroom purée into the pan and cook, allowing the mushrooms to release their moisture.

	When the moisture released by the mushrooms has boiled away, remove the mushrooms from the pan and set aside to cool. Etc........


Would you like to view additional Beef recipes enter 'y' yes <'or'> 'n' no

<!-- 
If the user enters 'y' the program will return to the page where the reicpes for the category is listed. 

If the user enters 'n' the user will have 2 options.--> 

Enter 'm' to go back to the main menu to select another category in the main menu menu <'or'> 'x' to exit the program 


<!-- make sure edge case returns invalid selection 
require user to input valid selection by prompting user for valid option











