class Image < ApplicationRecord
  require 'csv'
  mount_uploader :image, ImageUploader
  validates_presence_of :image
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.import(file)
    @errors =[]
    cnt=0
    CSV.foreach(file.path, headers: true) do |row|
      row = row.to_hash
      img = Image.new
      #photo = open("#{Rails.root.join('ch',row[1])}")
      img.image = ImageUploader.new
      img.remote_image_url = row['image']
      img.name = row['name']
      if !img.save
        img.errors.full_messages.each do |message|
          @errors << "#{message} for image #{cnt} in uploaded file."
        end
      end
      cnt+=1
    end
    @errors
  end
end
