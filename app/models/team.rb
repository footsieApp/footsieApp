class Team < ActiveRecord::Base
  has_many :home_fixtures
  has_many :away_fixtures
  def fixtures
    Fixture.find(:conditions => ["hometeam_id = ? OR awayteam_id = ?", id, id])
  end
end
