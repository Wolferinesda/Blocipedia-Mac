class Collaborator < ApplicationRecord
  belongs_to :wiki
  belongs_to :user

  validates_uniqueness_of :user_id
end
