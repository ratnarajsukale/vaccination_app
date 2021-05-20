class RenameSeatsNameToSlotsName < ActiveRecord::Migration[6.1]
  def change
    rename_column :hospitals, :seats, :slots
  end
end
