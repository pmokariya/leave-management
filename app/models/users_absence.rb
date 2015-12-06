class UsersAbsence < ActiveRecord::Base
	## Associate
	belongs_to :absence
	belongs_to :user
end
