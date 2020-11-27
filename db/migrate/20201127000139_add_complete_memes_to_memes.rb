class AddCompleteMemesToMemes < ActiveRecord::Migration[6.0]
  def change
    add_column :memes, :complete_meme, :text
  end
end
