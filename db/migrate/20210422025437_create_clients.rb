class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
