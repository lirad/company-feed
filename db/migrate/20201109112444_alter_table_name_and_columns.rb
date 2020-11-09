class AlterTableNameAndColumns < ActiveRecord::Migration[6.0]
  def change
    change_table :sales do |t|
      t.rename :comment, :Text
      t.remove :value
      t.rename :user_id, :AuthorId
    end
  end
end
