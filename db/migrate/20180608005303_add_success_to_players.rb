class AddSuccessToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :success, :boolean, null: false, default: true
  end
end
