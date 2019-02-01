class University < ApplicationRecord
    
    has_many :program_quotas

    validates :name, presence: true


    def to_s
        name
    end
end
