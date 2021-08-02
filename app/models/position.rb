class Position < ApplicationRecord
    has_many :oenologist_position_magazines, dependent: :destroy
    has_many :oenologists, through: :oenologist_position_magazines
    has_many :magazines, through: :oenologist_position_magazines
end
