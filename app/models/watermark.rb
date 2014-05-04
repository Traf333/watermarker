# == Schema Information
#
# Table name: watermarks
#
#  id                   :integer          not null, primary key
#  shop_id              :integer
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Watermark < ActiveRecord::Base
  belongs_to :shop

  has_attached_file :picture,
                    styles: {
                              medium: { geometry: '100x100>'},
                              small:  { geometry: '50x50>'}
                            }
  validates_attachment_content_type :picture, :content_type => ['image/gif', 'image/jpeg', 'image/png', 'image/x-ms-bmp']
end
