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

  accepts_nested_attributes_for :watermarks, allow_destroy: true, :reject_if => proc { |attrs| attrs['picture'].blank? }
  accepts_nested_attributes_for :images, allow_destroy: true, :reject_if => proc { |attrs| attrs['picture'].blank? }

  def watermark_path
    Rails.root.join('public').to_s + watermarks.first.picture(:original).split('?')[0]
  end

  def watermark
    watermarks.first.picture(:small).split('?')[0]
  end

  def authorize
     MyApp.configure_api domain, password
  end

end
