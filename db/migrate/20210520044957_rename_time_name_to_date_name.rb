class RenameTimeNameToDateName < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :time, :date
  end
end
