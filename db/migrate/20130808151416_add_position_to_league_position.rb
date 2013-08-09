class AddPositionToLeaguePosition < ActiveRecord::Migration
  def change
    add_column :league_positions, :position, :integer
  end
end
