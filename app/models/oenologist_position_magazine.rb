class OenologistPositionMagazine < ApplicationRecord
  belongs_to :position
  belongs_to :oenologist
  belongs_to :magazine
end
