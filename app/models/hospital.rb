class Hospital < ApplicationRecord
   validates :name, presence: true
   validates :address, presence: true
   validates :slots,   numericality: { only_integer: true }
   has_many :bookings

   def subtract_one_slot
      update!(slots: slots - 1)
   end

   def add_one_slot
      update!(slots: slots + 1)   
   end
end
