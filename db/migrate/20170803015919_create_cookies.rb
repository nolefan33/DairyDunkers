class CreateCookies < ActiveRecord::Migration[5.1]
  def change
    create_table :cookies do |t|
      t.string :title
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
