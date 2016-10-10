class LoanAccessory < ActiveRecord::Base
	validates :amount, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 1}
  belongs_to :loan
  belongs_to :accessory
  belongs_to :reserve
end
