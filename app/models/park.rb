class Park < ApplicationRecord

  validates_presence_of :name, :admission_price
  has_many :rides

  def ordered_rides
    rides.order(:name)
  end

  def average_thrill_rating
    rides.average(:thrill_rating).to_f
  end
end
