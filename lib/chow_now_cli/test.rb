require 'nokogiri'
require 'open-uri'
require 'pry-nav'

#html = "rpgsite.net/feature/8752-fire-emblem-three-houses-class-guide-best-classes-class-change-certification-requirements-skills-abilities-and-class-mastery"

@doc = Nokogiri::HTML(open('http://nychsfl.org/rosters/st-john-the-baptist/'))
		 data = @doc.css(".entry.fix")
		 data.each do |d|
 			binding.pry
 		end
# 		 end
# #name = @doc.xpath('//*[@id="article"]/div[2]/h3[24]')



# Headers
# @doc.css("xl64") => #
# @doc.css("xl65") => Last
# @doc.css("xl66")[0] => First
# @doc.css("xl66")[1] => Class
# @doc.css("xl66")[2]=> => Pos.
# @doc.css("xl66")[3] => => Ht.
# @doc.css("xl66")[4] => => Wt.
# @doc.css("x175") => => Hometown
