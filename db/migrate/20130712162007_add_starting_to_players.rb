class AddStartingToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :starting, :boolean, :default => false
  end
end
