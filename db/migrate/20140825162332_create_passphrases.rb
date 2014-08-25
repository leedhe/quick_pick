class CreatePassphrases < ActiveRecord::Migration
  def change
    create_table :passphrases do |t|
      t.integer :words
      t.string :security
      t.string :word_type

      t.timestamps
    end
  end
end
