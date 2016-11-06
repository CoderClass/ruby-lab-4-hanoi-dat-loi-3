class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sentivie: false}
  has_many :messages
end
