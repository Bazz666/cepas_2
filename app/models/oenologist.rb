class Oenologist < ApplicationRecord
    has_many :oenologist_wines, dependent: :destroy
    has_many :wines, through: :oenologist_wines

    has_many :oenologist_position_magazines, dependent: :destroy
    has_many :positions, through: :oenologist_position_magazines
    has_many :magazines, through: :oenologist_position_magazines

    def set_references(arr_jobs)
        self.oenologist_position_magazines.destroy_all
        arr_jobs = arr_jobs.reject { |m| m.empty? }

        arr_jobs.each do |m, jobs|
            jobs = jobs.reject { |j| j.empty? }
            
            jobs.each do |j|
                temp_moj = OenologistPositionMagazine.new
                temp_moj.magazine = Magazine.find(m.to_i)
                temp_moj.position = Position.find(j.to_i)
                temp_moj.oenologist = self
                temp_moj.save
            end
        end

    end

end
