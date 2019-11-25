class Product < ApplicationRecord
  # attr_accessor :title, :description, :price, :image_filename
  validates :title, presence: true
end
  #mount_uploader :image_filename, Image_filenameUploader
#end
