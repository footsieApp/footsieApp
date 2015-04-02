class Scrapper

	def self.scrape(url) 
		mechanize = Mechanize.new
		page = mechanize.get(url)
		
		array = page.search('.match-details')		
		
		array.each { |x|
			homeTeam = Team.create(name: x.search('.team-home a').text.strip)
			awayTeam = Team.create(name: x.search('.team-away a').text.strip)
			Fixture.create(home_team: homeTeam, away_team: awayTeam, date: x.search('.kickoff').text.strip)	 		
		}

		Team.all.each do |team|
  			puts team.name
		end

		Fixture.all.each do |fixture|
			puts fixture
		end
	end

end