class Garrison < ActiveRecord::Base
  belongs_to :reserve
  
  has_many :weapons
  has_many :munitions
  has_many :accessories
end
