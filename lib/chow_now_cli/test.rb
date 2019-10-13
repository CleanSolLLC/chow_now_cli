require 'pry-nav'
require 'nokogiri'
require 'open-uri'

i = 2
@doc = Nokogiri::HTML(open('http://nychsfl.org/rosters/st-john-the-baptist/'))
#a = @doc.css(".entry-container.fix").each do |a|
  data2 = @doc.css(".entry > table:nth-child(1) > tbody:nth-child(2) > tr")

    data2_length = 40

    while data2_length > 2
      number = data2[i].children[1].text
      lname  = data2[i].children[3].text
      fname  = data2[i].children[5].text
      grad   = data2[i].children[7].text
      pos    = data2[i].children[9].text
      heigt  = data2[i].children[11].text
      weight = data2[i].children[13].text
      town   = data2[i].children[15].text
    i+=1
    
    data2_length -=1 
  end



#   19] pry(main)> data[2].children[0].text
# => "\n"
# [20] pry(main)> data[2].children[1].text
# => "3"
# [21] pry(main)> data[2].children[2].text
# => "\n"
# [22] pry(main)> data[2].children[3].text
# => "Osorto"
# [23] pry(main)> data[2].children[4].text
# => "\n"
# [24] pry(main)> data[2].children[5].text
# => "Jeyse"
# [25] pry(main)> data[2].children[6].text
# => "\n"
# [26] pry(main)> data[2].children[7].text
# => "2020"
# [27] pry(main)> data[2].children[9].text
# => "RB/S"
# [28] pry(main)> data[2].children[11].text
# => "5’9″"
# [29] pry(main)> data[2].children[13].text
# => "170"
# [30] pry(main)> data[2].children[15].text
# => "Wyandanch"


 #data = @doc.css(".entry-container.fix").each do |a|


  # data = @doc.css(".entry > table:nth-child(1) > tbody:nth-child(2) > tr")[2,10]
  # player_name = "#{data[2].text} #{data[1].text}"
  # player_position = data[4].text
  # binding.pry

  # # player_town = data[7].text
# # puts player_name
# # puts player_position
# # puts player_town
# # end
     

#      data = a.css(".entry > table:nth-child(1) > tbody:nth-child(2) > tr")



# #   #data = @doc.css(".entry > table:nth-child(1) > tbody:nth-child(2) > tr")[2,10]

# #   binding.pry
#  table = @doc.at("tbody")
#        table.search("td").each do |td|
#         "#{td[2].text} #{td[1].text}"
#         binding.pry
#       end

#       #   p = td.xpath("//tr").children
#       #   binding.pry
#       #     puts "#{p}"
#       #   end

#       #   binding.pry
#       #   #puts "#{td}"
#       #   # binding.pry
#       # end
#    #stats = b.map do |c|
#  # end
#  #   #binding.pry
#  # end
#  #b.xpath("//tr/td/@val"
 
# # # List of Player names
# # fb = @doc.css("div.entry-container.fix").each do  |a|
# # # binding.pry


# # List of Player info:
# #   Position
# #   Number
# #   Town
# # BASE_URL = http://nychsfl.org/rosters/st-john-the-baptist/

# #html = "rpgsite.net/feature/8752-fire-emblem-three-houses-class-guide-best-classes-class-change-certification-requirements-skills-abilities-and-class-mastery"




# # @doc = Nokogiri::HTML(open('https://www.nba.com/warriors/roster'))
# #   name = @doc.css(".roster__player__header__heading")
# #   position = @doc.css(".roster__player__header_position")
# #   number = @doc.css(".roster__player__header_jnumber")
# #   player_url = @doc.css("footer.roster__player__footer [href]").attr("href").value
# #   info = @doc.css(".roster__player")
# #   	info.each do |p|
# #   player_bio = p.xpath("//div/@aria-label")
# #   	p.xpath("//div/dl").each do |p1|
# #   		p1

# # 		end
# # 	end

# # 	@doc2 = Nokogiri::HTML(open('player_url'))
# # 		stats = @doc2.css(".player-stats__stat-value")
# #   		binding.pry
 
# # [10] pry(main)> stats[1].text
# # => "27.3"
# # [11] pry(main)> stats[2].text
# # => "5.3"
# # [12] pry(main)> stats[3].text
# # => "5.3"
# # [13] pry(main)> stats[4].text
# # => "5.2"
# # [14] pry(main)> stats[5].text
# # => "5.2"
# # [15] pry(main)> stats[6].text
# # => "15.2"
# # [16] pry(main)> stats[7].text
# # => "6-3"
# # [17] pry(main)> stats[8].text
# # => "6-3"
# # [18] pry(main)> stats[9].text
# # => "190 lbs"
# # [19] pry(main)> stats[10].text
# # => "190 lbs"
# # [20] pry(main)> stats[11].text
# # => "31"
# # [21] pry(main)> stats[12].text
# # => "31"
# # [22] pry(main)> stats[13].text
# # => "03/14/1988"
# # [23] pry(main)> stats[14].text
# # => "Davidson/USA"
# # [24] pry(main)> stats[15].text
# # => "2009 Rnd 1 Pick 7"
# # [25] pry(main)> stats[16].text
# # => "2009"
# # [26] pry(main)> stats[17].text
# # => "10 yrs"
# # [27] pry(main)> stats[18].text

