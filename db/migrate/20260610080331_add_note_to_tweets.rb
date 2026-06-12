class AddNoteToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :note, :text
  end
end
