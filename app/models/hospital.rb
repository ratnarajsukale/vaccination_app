class Hospital < ApplicationRecord
   has_many :bookings

   def subtract_one_slot
      update!(slots: slots - 1)
   end

   def add_one_slot
      update!(slots: slots + 1)   
   end
end
