class Tournament < ActiveRecord::Base
	before_save { self.name = name.downcase }
	
	validate :name, presence: true, uniqueness: { case_sensitive: false }
	has_many :fixtures

end
