class AddDateToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :date, :datetime
  end
end
