class Coursemodule < ApplicationRecord
  has_one_attached :avatar
  has_many :internalprojects
  belongs_to :user
end
