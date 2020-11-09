class AddUserColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :FullName, :string
    add_column :users, :Username, :string
    add_column :users, :Photo, :string
    add_column :users, :CoverImage, :string
  end
end
