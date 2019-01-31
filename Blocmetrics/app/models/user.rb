class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, presence: true, length: {minimum: 6}
  validates :password, length: {minimum:6}, allow_blank: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum:254}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :registered_applications, dependent: :destroy
end
