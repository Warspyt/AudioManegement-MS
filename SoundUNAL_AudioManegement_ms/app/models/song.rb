class Song < ApplicationRecord
  # has_one_attached :photo

  validates :title, presence: true
  validates :publicationDate, presence: true
  validates :lyrics, presence: true
  validates :version, presence: true
  validates :userid, presence: true
  validates :audioid, presence: true
  validates :albumid, presence: true
end
