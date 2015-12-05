class UsersAbsence < ActiveRecord::Base
	belongs_to :absence
	belongs_to :user
end
