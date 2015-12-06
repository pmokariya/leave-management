class Absence < ActiveRecord::Base
  ## Associate
  has_and_belongs_to_many :users
  has_many :users_absences, dependent: :destroy
  has_many :user_for_absences, :through =>:users_absences , :source => "user"

  ## validates
	validates :manager_id,:reason, presence: true
end
  