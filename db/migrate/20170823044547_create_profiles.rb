class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :height
      t.integer :weight
      t.integer :age
      t.boolean :trainer
      t.integer :experience
      t.string :direction
      t.string :twitter_id
      t.string :instagram_id
      t.string :line_id
      t.string :website_url
      t.text :goal_text
      t.string :competition
      t.string :comp_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
