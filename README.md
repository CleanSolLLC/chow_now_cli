# ChowNowCli

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/chow_now_cli`. To experiment with that code, run `bin/console` for an interactive prompt.

## About ChowNowCli

Normally a user searches for a recipe based on a food type i.e. beef, seafood, pasta etc. A search engine will return numerous websites and the user would select a website and do a search of recipes from that particular site. The user picks a recipe that looks delicious based on the picture, the description, ratings and maybe even the reviews. After all of this effort not to mention waiting for images and the recipes to load (thanks to banners, pop ups and other annoying distractions that impact load time) the user clicks on the recipe and directions only to notice that she/he does not have 30 minutes of prep time and 1 hour of cooking time to get the meal prepared for dinner! Even worse the user has the time but does not have all of the ingredients for the recipe! This CLI will eliminate those problems by providing the user with the necessary information early in the search process.


A command line interface for AllRecipes.com
This cli scrapes data from 
https://www.allrecipes.com/recipes/


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chow_now_cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chow_now_cli

## Usage

where user types in ruby ./bin/chow_now_cli

or bin/console

Welcome to the Chow Now CLI!

	1.Beef
	2.Pasta
	3.Seafood
	4.Pork
	5.Turkey
	6.Vegetarian
	7.Vegan

Please enter a number between 1 and 7 for meal type <'or'> 'x' to exit



Based on menu selection i.e. user selects:
   
 # Option 1. Beef -- will return 
   
 Selection (Beef) 		Reviews  	Stars	Prep Time  Cook Time 	Total Time

  1 Beef Wellington    	500 		5		30 min	   	1 hour		1hr:30 min
  2 Beef Kabobs			1075 		4		1 hr  		45 min		1hr:45 min
  3 Sirloin				3067		3		10 min 		30 min		0hr:40 min
  4 Meat Loaf			499			3		45 min 		2 hours		2hr:45 min

 *** Note: Input is not case sensitive

 Enter a menu number, 'x' to exit the program or 'm' to go back to the main menu

 *** Entering 'x' => exits the program

 *** Entering 'm' => takes you back to the main menu

 *** Entering a menu number prints to the screen the name of the recipe, description, ***ingredients and instructions

 
 Beef Wellington
   
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

*** If the user enters 'n' the user will then see the following prompt

Enter 'm' to go back to the main menu to select another category in the main menu menu <'or'> 'x' to exit the program 

*** If the user enters 'y' the list of recipes based on category reappears

 # Option 1. Beef -- will return 
   
 Selection (Beef) 		Reviews  	Stars	Prep Time  Cook Time 	Total Time

  1 Beef Wellington    	500 		5		30 min	   	1 hour		1hr:30 min
  2 Beef Kabobs			1075 		4		1 hr  		45 min		1hr:45 min
  3 Sirloin				3067		3		10 min 		30 min		0hr:40 min
  4 Meat Loaf			499			3		45 min 		2 hours		2hr:45 min

Enter a menu number, 'x' to exit the program or 'm' to go back to the main menu

*** If the user enters 'x' at any point when prompted in the program the program will halt
*** execution 

Thank you for using the Chow Now CLI!
[11:42:58](master) chow_now_cli
// ♥ 


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/chow_now_cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ChowNowCli project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/chow_now_cli/blob/master/CODE_OF_CONDUCT.md).
