class Absence < ActiveRecord::Base
	# belongs_to :user
	# has_many :users_absences, dependent: :destroy

	has_and_belongs_to_many :users
    has_many :users_absences, dependent: :destroy
    has_many :user_for_absences, :through =>:users_absences , :source => "user"


	validates :manager_id,:reason, presence: true
end
  