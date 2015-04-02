class Team < ActiveRecord::Base
	before_save { self.name = name.downcase }

	attr_accessor :name

	validates :name, presence: true, uniqueness: true
	has_many :fixtures

end
