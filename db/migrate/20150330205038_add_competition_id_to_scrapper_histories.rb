class AddCompetitionIdToScrapperHistories < ActiveRecord::Migration
  def change
    add_column :scrapper_histories, :competition_id, :integer
  end
end
