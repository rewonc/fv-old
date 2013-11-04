class Farmer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :farm, dependent: :destroy
	validates :first_name, presence: true
	validates :last_name, presence: true

#add confirmable later
end

