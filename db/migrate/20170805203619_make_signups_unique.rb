class MakeSignupsUnique < ActiveRecord::Migration[5.1]
  def change
    add_index :sign_ups, :email, unique: true
  end
end
