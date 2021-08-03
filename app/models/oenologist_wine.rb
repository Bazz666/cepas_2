class OenologistWine < ApplicationRecord
  belongs_to :oenologist , :optional => true
  belongs_to :wine , :optional => true
end
