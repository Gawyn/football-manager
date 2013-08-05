class RemoveLeagueidFromTeams < ActiveRecord::Migration
  def change
    def up
      remove_column :teams, :league_id
    end
    def down
      add_colum :teams, :league_id, :integer
    end
  end
end
