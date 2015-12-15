class AddAttachmentPictureToProjects < ActiveRecord::Migration
  def up
    add_attachment :projects, :picture
  end

  def down
    remove_attachment :projects, :picture
  end
end
