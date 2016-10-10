class LoanMunitionLog < ActiveRecord::Base
  belongs_to :loan
  belongs_to :munition
  belongs_to :reserve
end
