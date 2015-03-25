class Team < ActiveRecord::Base
	has_many :fixtures
  def fixtures
    Fixture.where("hometeam_id = ? OR awayteam_id = ?", id, id)
  end
end
