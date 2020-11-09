class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :followings, :FollwerId, :FollowerId
  end
end
