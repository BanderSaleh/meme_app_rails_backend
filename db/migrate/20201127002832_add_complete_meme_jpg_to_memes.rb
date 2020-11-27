class AddCompleteMemeJpgToMemes < ActiveRecord::Migration[6.0]
  def change
    add_column :memes, :complete_meme_jpg, :text
  end
end
