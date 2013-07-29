class AddColumnsToLeaguePosAnd < ActiveRecord::Migration
  def change
    rename_column :league_positions, :point, :points
    add_column :league_positions, :team_id, :integer
    add_column :league_positions, :league_id, :integer
  end
end
