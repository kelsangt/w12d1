# == Schema Information
#
# Table name: poke_moves
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  move_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PokeMove < ApplicationRecord
  belongs_to :pokemon,
    primary_key: :id,
    foreign_key: :pokemon_id,
    class_name: :Pokemon

  belongs_to :move,
    primary_key: :id,
    foreign_key: :move_id,
    class_name: :Move


  validates :pokemon_id, uniqueness: { scope: :move_id,
      message: "Pokemon cannnot have the same move more than once"}

  
end
