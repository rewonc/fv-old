class Contact < ActiveRecord::Base
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :email, presence: true
	validates :phone, presence: true
	validates :farmname, presence: true
	validates :markets, presence: true
	validates :produce, presence: true
end
