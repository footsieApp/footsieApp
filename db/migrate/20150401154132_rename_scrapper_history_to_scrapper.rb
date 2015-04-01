class RenameScrapperHistoryToScrapper < ActiveRecord::Migration
  def change
  	rename_table :scrapper_histories, :scrappers
  end
end
