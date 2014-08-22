class CreatePasswordPages < ActiveRecord::Migration
  def change
    create_table :password_pages do |t|
      t.integer :c_num
      t.string :security
      t.integer :like
      t.string :comment

      t.timestamps
    end
  end
end
