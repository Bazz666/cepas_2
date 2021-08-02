class WineStrain < ApplicationRecord
  belongs_to :Wine , :optional => true
  belongs_to :strain, :optional => true
end
