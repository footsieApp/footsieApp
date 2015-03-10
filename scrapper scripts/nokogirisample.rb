require 'nokogiri'

f = File.open("Additional Docs/SportsPages/BBC Test Data.html")
doc = Nokogiri::HTML(f)


matchArray = doc.css('tr.preview') #Get all match instances
y = 0
matchArray.each { 
	|x|

	puts 'Game: ' + y.to_s + " Home: " + x.css('.team-home a').text.strip + ' v Away: ' + x.css('.team-away a').text.strip + " " + x.css('.kickoff').text
	y += 1
	}

f.close
