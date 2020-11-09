class AddForeingKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :followings, :users, column: :FollowerId
    add_foreign_key :followings, :users, column: :FollowedId
  end
end
