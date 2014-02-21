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
end
