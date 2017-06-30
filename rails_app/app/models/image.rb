class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :image
  validates :name, presence: true, uniqueness: { case_sensitive: false }


end
