class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :industry
      t.references :user

      t.timestamps
    end
  end
end
