class Farmer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :farm
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :age, presence: true
	validates_numericality_of :age, greater_than_or_equal_to: 10, less_than: 100, only_integer: true, message: "DB won't accept ages outside of 10-99"


#add confirmable later
end

