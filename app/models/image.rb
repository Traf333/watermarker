# == Schema Information
#
# Table name: images
#
#  id                   :integer          not null, primary key
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

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
