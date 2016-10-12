class LoanMunitionLog < ActiveRecord::Base
  validates :amount, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 1}
  belongs_to :loan
  belongs_to :munition
  belongs_to :reserve
end
