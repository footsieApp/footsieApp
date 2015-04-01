class RenameScrapperHistoryIdOnFixture < ActiveRecord::Migration
  def change
  	rename_column :fixtures, :scrapper_history_id, :scrapper_id
  end
end
