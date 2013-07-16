class CreateLeaguePositions < ActiveRecord::Migration
  def change
    create_table :league_positions do |t|
      t.integer :number

      t.timestamps
    end
  end
end
