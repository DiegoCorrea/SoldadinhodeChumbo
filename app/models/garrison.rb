class Garrison < ActiveRecord::Base
  belongs_to :reserve
  
  has_many :weapons, :dependent => :destroy
  has_many :munitions, :dependent => :destroy
  has_many :accessories, :dependent => :destroy
end
