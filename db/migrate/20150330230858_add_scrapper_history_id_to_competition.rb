class AddScrapperHistoryIdToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :scrapper_history_id, :integer
  end
end
