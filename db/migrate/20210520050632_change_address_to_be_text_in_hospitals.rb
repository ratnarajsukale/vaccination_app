class ChangeAddressToBeTextInHospitals < ActiveRecord::Migration[6.1]
  def change
    change_column :hospitals, :address, :text
  end
end
