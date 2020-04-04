class AddAttachmentAvatarToMyContacts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :my_contacts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :my_contacts, :avatar
  end
end
