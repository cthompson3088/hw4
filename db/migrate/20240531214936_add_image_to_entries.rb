class AddImageToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :image, :text
  end
end
