class CreateDrawings < ActiveRecord::Migration
  def change
  	create_table :drawings do |t|
  	  t.string :title
  	  t.integer :user_id, null: false
  	  t.text :image_url, null: false

  	  t.timestamps null: false
  	end
  end
end
