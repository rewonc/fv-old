class Email < ActiveRecord::Base
	#validates :name, presence: true
	validates :email, presence: true
	#validates :zip, presence: true
end
