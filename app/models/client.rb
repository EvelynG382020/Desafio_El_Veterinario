class Client < ApplicationRecord
    has_many :pets

    def owned_pets
        pets.count
    end
end
