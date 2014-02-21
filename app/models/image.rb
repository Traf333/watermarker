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

  belongs_to :shop

  require 'paperclip_processors/watermark'

  has_attached_file :picture,
                    processors: [:thumbnail, :watermark],
                    styles: {
                        medium: { geometry: '600x600>',
                                  watermark_path: shop.watermarks.first.picture.url}

                    }

  validates_attachment_content_type :picture, content_type: ['image/gif', 'image/jpeg', 'image/png', 'image/x-ms-bmp']
  validates_attachment_presence :picture
end
