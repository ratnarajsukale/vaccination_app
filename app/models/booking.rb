class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hospital
  validate :date_cannot_be_in_the_past
  validates :date, presence: true

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end  
end
