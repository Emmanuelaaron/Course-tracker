class User < ApplicationRecord
  validates :email, :username, uniqueness: true, presence: true
  has_many :projects
end
