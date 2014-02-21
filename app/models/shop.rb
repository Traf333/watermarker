# == Schema Information
#
# Table name: shops
#
#  id                     :integer          not null, primary key
#  domain                 :string(255)
#  name                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  watermark_file_name    :string(255)
#  watermark_content_type :string(255)
#  watermark_file_size    :integer
#  watermark_updated_at   :datetime
#

class Shop < ActiveRecord::Base

  has_many :watermarks
  has_many :images

  accepts_nested_attributes_for :watermarks, allow_destroy: true

end
