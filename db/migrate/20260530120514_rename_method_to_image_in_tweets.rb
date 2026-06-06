class RenameMethodToImageInTweets < ActiveRecord::Migration[7.2]
  def change
      rename_column :tweets, :method, :image
  end
end
