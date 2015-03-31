class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.string :date

      t.timestamps null: false
    end
  end
end
