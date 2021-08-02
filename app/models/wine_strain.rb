class WineStrain < ApplicationRecord
  belongs_to :Wine
  belongs_to :strain
end
