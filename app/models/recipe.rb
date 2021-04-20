class Recipe < ApplicationRecord
  attachment :image

  acts_as_taggable   # acts_as_taggable_on :tags の省略
  acts_as_taggable_on :skills, :interests  # @recipe.skill_list とかが使えるようになる


  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
