class CreateLeaguePositions < ActiveRecord::Migration
  def change
    create_table :league_positions do |t|
      t.integer :points
      t.integer :team_id
      t.integer :league_id

      t.timestamps
    end
  end
end
