class AddSeatsToHospitals < ActiveRecord::Migration[6.1]
  def change
    add_column :hospitals, :seats, :integer
  end
end
