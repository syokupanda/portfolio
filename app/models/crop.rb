class Crop < ApplicationRecord
  attachment :image

  belongs_to :user
end
