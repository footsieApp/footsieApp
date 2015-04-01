class Fixture < ActiveRecord::Base
	belongs_to :competition
	belongs_to :scrapper
	belongs_to :hometeam, class_name: "Team",
						foreign_key: "hometeam_id"
	belongs_to :awayteam, class_name: "Team",
						foreign_key: "awayteam_id"
end
