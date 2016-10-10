class LoanAccessory < ActiveRecord::Base
  belongs_to :loan
  belongs_to :accessory
  belongs_to :reserve
end
