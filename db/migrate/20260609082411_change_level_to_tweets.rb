class ChangeLevelToTweets < ActiveRecord::Migration[7.2]
  def change
    change_column :tweets, :level, :string
  end
end
