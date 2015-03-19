class CreateScrapperHistories < ActiveRecord::Migration
  def change
    create_table :scrapper_histories do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
