class Park < ApplicationRecord

  validates_presence_of :name, :admission_price
  has_many :rides

  def ordered_rides
    rides.order(:name)
  end
end
