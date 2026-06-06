class AddSizeAndJumpToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :size, :string
    add_column :tweets, :jump, :string
  end
end
