class Coursemodule < ApplicationRecord
  has_one_attached :avatar
  has_many :internalprojects
  has_many :projects, through: 'internalprojects'
  belongs_to :user
end
