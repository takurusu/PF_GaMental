class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|

      t.integer :user_id, null: false
      t.string :image_id, null: false
      t.string :title, null: false
      t.string :text, null: false
      t.datetime :created_at, null: false, default: -> { 'NOW()' }
      t.datetime :updated_at, null: false, default: -> { 'NOW()' }

      t.timestamps

    end
  end
end
