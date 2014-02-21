class AddAttachmentPictureToWatermarks < ActiveRecord::Migration
  def self.up
    change_table :watermarks do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :watermarks, :picture
  end
end
