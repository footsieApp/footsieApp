require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('file:///home/duinn/Workspace/footsieApp/Additional Docs/SportsPages/BBC Test Data.html')

array = page.search('.match-details a')
y = 0
array.each { 
	|x|
	 puts x.text.strip
	}
