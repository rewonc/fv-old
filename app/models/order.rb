class Order < ActiveRecord::Base
  validates :box_count, presence: true
  validates :frequency, presence: true
  validates :firstname, presence: true
  validates :fullname, presence: true
  validates :address1, presence: true
  validates :address2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :delivery_window, presence: true
  validates :first_delivery, presence: true
  belongs_to :user
end
