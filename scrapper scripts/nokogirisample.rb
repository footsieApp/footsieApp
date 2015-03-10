require 'nokogiri'

f = File.open("Additional Docs/SportsPages/BBC Test Data.html")
doc = Nokogiri::HTML(f)
dateArray = doc.css('table.table-stats')#Date is contain in a super class
dateArray.each {
	|dateElement|
	matchArray = dateElement.css('tr.preview')#Get all the match instances for the date
	y = 0
	matchArray.each { 
		|x|
		puts dateElement.css('caption').text[38..-1] + " " + x.css('.kickoff').text.strip
		puts 'Game: ' + y.to_s + " Home: " + x.css('.team-home a').text.strip + ' v Away: ' + x.css('.team-away a').text.strip
		y += 1
		}
}
f.close


