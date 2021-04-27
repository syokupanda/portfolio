class Making < ApplicationRecord
  attachment :image
  belongs_to :recipe
end
