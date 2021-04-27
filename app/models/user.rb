class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipe
  has_many :reviews
  has_many :favorites
  has_many :crops, dependent: :destroy


  #----------フォロー機能中間テーブル----------
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy

  has_many :followers, through: :reverse_of_relationships, source: :follow
  has_many :follows, through: :relationships, source: :followed
  #--------------------------------------------

  attachment :image

  def your_farmer
    if self.is_farmer == true
      self.nickname + "(公認ユーザー）"
    else
      self.nickname
    end
  end

  def full_name
      self.last_name + self.first_name
  end

  # フォロー機能定義
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    follows.include?(user)
  end
end




