class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :surname
      t.string :position
      t.integer :quality
      t.integer :team_id

      t.timestamps
    end
  end
end
