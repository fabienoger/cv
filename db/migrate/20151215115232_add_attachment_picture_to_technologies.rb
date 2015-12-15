class AddAttachmentPictureToTechnologies < ActiveRecord::Migration
  def up
    add_attachment :technologies, :picture
  end

  def down
    remove_attachment :technologies, :picture
  end
end
