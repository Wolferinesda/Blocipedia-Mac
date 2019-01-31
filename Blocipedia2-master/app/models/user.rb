class User < ApplicationRecord
  after_initialize :init
  before_update :publish_wikis

  def init
    self.role ||= :standard
  end

  validates :password, presence: true, length: {minimum: 6}
  validates :password, length: {minimum:6}, allow_blank: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum:254}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :registerable, :confirmable

  has_many :collaborators
  has_many :wiki_collabs, source: 'wiki', through: :collaborators
  has_many :wikis, dependent: :destroy

  before_save { self.role ||= :standard }

  private

  def publish_wikis
    return unless role_was == 'premium' && role == 'standard'
    wikis.update_all(private: false)
  end

  enum role: [:standard, :premium, :admin]
end
