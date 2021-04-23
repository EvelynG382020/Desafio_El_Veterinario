class Pet < ApplicationRecord
  belongs_to :client
  has_many :pet_histories #crea un metodo de instancia tal cual con ese nombre
  accepts_nested_attributes_for :pet_histories, :client
  
  def history_count
    pet_histories.count
  end
  
  def avg_weight
    pet_histories.average(:weight)
  end

  def avg_height
    pet_histories.average(:height)
  end

  def max_weight
    pet_histories.maximum(:weight)
  end

  def max_height
    pet_histories.maximum(:height)
  end

  def owner
    client.name
  end

end
