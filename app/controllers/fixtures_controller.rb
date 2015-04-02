class FixturesController < ApplicationController  

  def index    
    Scrapper.scrape('file:///Users/ian/Documents/Workspaces/Personal%20Development/footsieApp/Additional%20Docs/SportsPages/BBC.html')
  end

end
