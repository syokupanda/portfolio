class Making < ApplicationRecord
  attachment :image
  belongs_to :recipe
  
  #--------------------------------------------
  validates :process, presence: true
  #--------------------------------------------
end
