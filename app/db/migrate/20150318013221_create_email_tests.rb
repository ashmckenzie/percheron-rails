class CreateEmailTests < ActiveRecord::Migration
  def change
    create_table :email_tests do |t|
      t.string :email
      t.boolean :sent

      t.timestamps null: false
    end
  end
end
