class CreateComment < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  	  t.string :content, null: false
  	  t.integer :user_id
  	  t.integer :drawing_id

  	  t.timestamps null: false
  	end
  end
end
