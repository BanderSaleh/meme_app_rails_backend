class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.string :toptext
      t.string :bottomtext
      t.integer :user_id
      t.text :image_url

      t.timestamps
    end
  end
end
