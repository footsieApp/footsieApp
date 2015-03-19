class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :hometeam_id
      t.integer :awayteam_id
      t.datetime :date
      t.integer :scrapper_history_id
      t.integer :competition_id

      t.timestamps null: false
    end
  end
end
