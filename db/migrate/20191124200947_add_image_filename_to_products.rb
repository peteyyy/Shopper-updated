class AddImageFilenameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image_filename, :string
  end
end
