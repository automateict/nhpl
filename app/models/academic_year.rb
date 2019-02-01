class AcademicYear < ApplicationRecord

    has_many :events
    has_many :applicants
    has_many :program_quotas

    validates :name, presence: true
    

    def self.current
        self.where('status = ?', true).first
    end

    def current_status
        status? ? 'Active' : ''
    end

    def to_s
        name
    end
end

