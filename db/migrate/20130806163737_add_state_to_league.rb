class AddStateToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :state, :string
  end
end
