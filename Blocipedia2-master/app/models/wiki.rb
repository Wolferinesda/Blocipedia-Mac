class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  default_scope { order('created_at DESC') }

  before_save { self.private ||= false }

  scope :visible_to, -> (user) do
    return all if user.premium? || user.admin?
    where(private: [false, nill])
  end

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true

end
