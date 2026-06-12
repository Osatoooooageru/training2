class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :type
      t.text :part
      t.string :tool
      t.string :method
      t.integer :level
      t.string :video

      t.timestamps
    end
  end
end