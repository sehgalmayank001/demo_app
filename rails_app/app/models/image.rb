class Image < ApplicationRecord
  require 'csv'
  require 'uri'
  mount_uploader :image, ImageUploader
  mount_base64_uploader :image, ImageUploader
  validates_presence_of :image,:name
  validate :name_validation
  belongs_to :user

  def self.import(file,user_id)
    # begin
    @errors =[]
    cnt=0
    if File.zero?(file.path) then return @errors << "Empty file." end
    csv_file =  CSV.read(file.path, headers: true)
    if csv_file.count == 0 then return  @errors << "No records in file." end
    if csv_file.headers.empty? then return @errors << "Headers missing in file." end
    if !csv_file.headers.include?('name') then return @errors << "name header missing." end
    if !csv_file.headers.include?('image') then return @errors << "image header missing." end
      csv_file.each do |row|
        if row['image'] && !validate_url?(row['image'])
          @errors << "Invalid image url for image #{cnt}"
          next
        end
        img = Image.new
        img.image = ImageUploader.new
        img.remote_image_url = row['image']
        img.name = row['name']
        img.user_id =  user_id
        if !img.save
          img.errors.full_messages.each do |message|
            @errors << "#{message} for image #{cnt} in uploaded file."
          end
        end
        cnt+=1
      end
      @errors
    # rescue CSV::MalformedCSVError => e
    #   @errors << "#{e.message}"
    # end
  end

private
  def name_validation
    if !Image.where("name=? and user_id=?", self.name, self.user_id).empty?
      self.errors.add(:name, "has already been taken")
    end
  end

  def self.validate_url?(url)
     url =~ URI::regexp
  end
end
