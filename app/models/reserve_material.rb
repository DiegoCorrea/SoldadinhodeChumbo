class ReserveMaterial < ActiveRecord::Base
  belongs_to :weapons
  belongs_to :accessories
  belongs_to :munitions
end
