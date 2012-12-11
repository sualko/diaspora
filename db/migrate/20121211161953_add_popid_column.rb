class AddPopidColumn < ActiveRecord::Migration
  def change
    add_column :users, :popid, :string
  end
end
