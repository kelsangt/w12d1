# == Schema Information
#
# Table name: moves
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Move < ApplicationRecord
    validates :name, length: {in 3...255}, uniqueness: { message: "'%{value}' is already in use" }

    has_many :poke_moves, 
        primary_key: :id, 
        foreign_key: :move_id, 
        class_name: :PokeMove,
        dependent: :destroy 

end
