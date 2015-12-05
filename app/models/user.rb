class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_and_belongs_to_many :absences
    has_many :users_absences, dependent: :destroy 
    has_many :absences_requests , :through =>:users_absences, :source => "absence"

    # has_many :request_for_absences ,:class=>"users_absences"
    # has_many :request_to_absences ,:class=>"users_absences"
    validates :role, presence: true
    
    ROLE = [ "employee", "manager" ]
end
  