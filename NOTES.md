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
        Recipe
        	User 

a command line interface for AllRecipes.com
https://www.allrecipes.com/recipes/
where user types in chow_now_cli

Normally a user would search for a recipe based on a food type i.e. beef, seafood chicken etc. in a search engine which would return numerous websites. The user then picks a website that would list the recipes. The user picks a recipe that looks at the delicious picture, reads the ratings, descriptions and maybe even the reviews. After all of this effort the user clicks on the recipe directions and notices that she does not have 30 minutes of prep time and 1 hour of cooking time to get the meal prepared for dinner or even worse the user does not have the  ingredients for the recipe! This CLI will eliminate that problem by providng the user with that information earlier in the process.


Prints Welcome Message

Welcome to the Chow Now CLI!

	1.Beef
	2.Chicken
	3.Seafood
	4.Pork
	5.Turkey
	6.Vegetarian
	7.Vegan

Enter menu number or 's' for saved recipes or 'x' to exit the program

<!-- make sure edge case returns invalid selection 
require user to input valid selection by prompting user for a valid menu number or exit -->



Based on menu selection i.e. user selects:
   
 # Option 1. Beef -- will return 
   
 Selection (beef) 		Ratings  	Reviewers	Prep Time  Cook Time 	Total Time

  1 Beef Wellington    	5 stars 	500			30 min	   	1 hour		1hr:30 min
  2 Beef Kabobs			4 stars 	1075	   	1 hr  		45 min		1hr:45 min
  3 Sirloin				3 stars 	3067		10 min 		30 min		0hr:40 min
  4 Meat Loaf			3 stars 	499			45 min 		2 hours		2hr:45 min
  
<!--  # Option 2. chicken-- will return all chicken recipes same format as beef
 # Option 3. Fish 	-- will return all fish recipes same format as beef
 # Option 4. Pork 	-- will return all pork recipes same format as beef
 # Option 5. Turkey -- will return all turkey recipes same format as beef
 # Option 6. Vegetarian -- will return all vegetarian recipes same format
 # Option 7. Vegan -- will return all vegan recipes same format  -->  

 Enter a menu number, 'x' to exit the program or 'm' to go back to the main menu


<!--  #make sure edge case returns invalid selection 
 #require user to input valid selection by prompting the user for a valid menu #number or exit -->


   1.Beef Wellington

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


    Enter 's' to save recipe; 'p' previous menu ; m' to go back to the main menu or
	'x' to exit the program

<!-- make sure edge case returns invalid selection 
require user to input valid selection by prompting user for valid option

Enter 's' to save recipe; 'p' previous menu ; m' to go back to the main menu or
'x' to exit the program -->









