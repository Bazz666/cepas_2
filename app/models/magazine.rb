class Magazine < ApplicationRecord
    has_many :oenologist_position_magazines, dependent: :destroy
    has_many :positions, through: :oenologist_position_magazines
    has_many :oenologists, through: :oenologist_position_magazines
end
