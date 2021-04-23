class CreatePetHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_histories do |t|
      t.integer :weight
      t.integer :height
      t.string :diagnosis
      t.text :description
      t.belongs_to :pet

      t.timestamps
    end
  end
end
