class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.date :birth
      t.belongs_to :client

      t.timestamps
    end
  end
end
