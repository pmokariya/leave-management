class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    ## Associate
    has_and_belongs_to_many :absences
    has_many :users_absences, dependent: :destroy 
    has_many :absences_requests , :through =>:users_absences, :source => "absence"

    ## validates
    validates :role, presence: true
    
    ## array of user role
    ROLE = [ "employee", "manager" ]
end
  