class Image < ActiveRecord::Base

  has_attached_file :picture, {
      :styles => {
          :thumb => ["50x50#", :png],
          :medium => ["100x100#", :png],
          :large => ["300x300>", :png]
      }
  }
  validates_attachment_content_type :picture, :content_type => ['image/gif', 'image/jpeg', 'image/png', 'image/x-ms-bmp']
  validates_attachment_presence :picture
end
