class Reserve < ActiveRecord::Base
	has_many :soldiers
	has_one :garrison
end
