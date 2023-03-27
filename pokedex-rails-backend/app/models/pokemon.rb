# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
  validates :id, :number, :name, :attack, :attack, :defense, :poke_type, :image_url, presence: true
  validates :captured, inclusion: [true, false]
  validates :name, length: { in: 3..255 }, uniqueness: { message: "'%{value}' is already in use" }
  validates :number, numericality: { greater_than: 0 }
  validates :attack, numericality: { in: 0..100 }
  validates :defense, numericality: { in: 0..100 }

  has_many :items,
           primary_key: :id,
           foreign_key: :pokemon_id,
           class_name: :Item,
           dependent: :destroy
end
