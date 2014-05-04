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
#  shop_id              :integer
#

class Image < ActiveRecord::Base

  belongs_to :shop

  require 'paperclip_processors/watermark'

  attr_accessor :watermark

  has_attached_file :picture,
                    processors: [:thumbnail, :watermark],
                    styles: {
                        small: { geometry: '100x100>', watermark_path: Rails.root.join('public/images/watermark.png').to_s },
                        medium: { geometry: '600x600>', watermark_path: Rails.root.join('public/images/watermark.png').to_s}

                    }

  validates_attachment_content_type :picture, content_type: ['image/gif', 'image/jpeg', 'image/png', 'image/x-ms-bmp']

  def self.watermark_path
    shop.watermarks.first.picture(:small)
  end


end
