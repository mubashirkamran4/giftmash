class CreateGifts < ActiveRecord::Migration[7.2]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :image_url
      t.string :url

      t.timestamps
    end
    add_index :gifts, :name, unique: true
  end
end
