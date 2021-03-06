class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :charges, :through => :orders
  belongs_to :promocode
  validates :first, presence: true
  validates :last, presence: true
  validates :zip, presence: true
end
