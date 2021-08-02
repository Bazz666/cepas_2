class OenologistPositionMagazine < ApplicationRecord
  belongs_to :oenologist, through: :oenologist_position_magazines
  belongs_to :position, through: :oenologist_position_magazines
  belongs_to :magazine, dependent: :destroy
end
