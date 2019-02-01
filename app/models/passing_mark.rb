class PassingMark < ApplicationRecord
  belongs_to :academic_year
  belongs_to :program
end
