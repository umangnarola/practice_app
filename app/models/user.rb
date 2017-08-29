class User < ApplicationRecord
  # rolify
  validates :email, uniqueness: true
  validates_presence_of :firstname
  has_many :prodacts, :dependent => :destroy
  enum role: [:admin,:user]
   resourcify
  def active_for_authentication?
    super && is_active == 'true'.present?
  end
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable,:omniauthable
end
