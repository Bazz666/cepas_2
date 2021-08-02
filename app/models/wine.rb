class Wine < ApplicationRecord
    
    has_many :wine_strains
    has_many :strains, through: :wine_strains
  
    validates :name, presence: true
    accepts_nested_attributes_for :wine_strains, reject_if: :all_blank, allow_destroy: true

    
    def addStrainPercent(percents)
        percents.each do |strain_id, percentage| 
            if percentage != "" 
                temp_strain = self.wine_strains.where(strain_id: strain_id).first
                temp_strain.percentage = percentage.to_i
                temp_strain.save
            end
        end
    end
    
    def getPercentageByStrainId(strain_id)
        if self.wine_strains.where(strain_id: strain_id.to_i).first
            self.wine_strains.where(strain_id: strain_id.to_i).first.percentage
        end
    end
end
