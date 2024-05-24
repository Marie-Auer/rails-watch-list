class List < ApplicationRecord
  has_many :bookmarks
  validates :name, presence: true, uniqueness: true
  has_many :movies, through: :bookmarks, dependent: :destroy

  has_one_attached :photo
end
