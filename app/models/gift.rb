class Gift < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
end
