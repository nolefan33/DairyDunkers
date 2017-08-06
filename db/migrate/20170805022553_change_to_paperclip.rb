class ChangeToPaperclip < ActiveRecord::Migration[5.1]
  def up
    remove_column :cookies, :photo
    add_attachment :cookies, :photo
  end

  def down
    remove_attachment :cookies, :photo
    add_column :cookies, :photo
  end
end
