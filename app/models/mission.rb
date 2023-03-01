class Mission < ApplicationRecord
    belongs_to :planet 
    belongs_to :scientist

    validates_presence_of :name, :scientist_id, :planet_id 
    validates :scientist, uniqueness: true
end
