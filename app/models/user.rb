class User < ApplicationRecord
  validates :email, :username, uniqueness: true, presence: true
end
