class CreateImagePaths < ActiveRecord::Migration
  def change
    create_table :image_paths do |t|
      t.string :image_name, null: false
      t.string :image_path

      t.timestamps null: false
    end
  end
end
