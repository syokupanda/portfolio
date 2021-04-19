class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipe
  has_many :reviews
  has_many :favorites
  
  #----------フォロー機能中間テーブル----------
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  
  has_many :follower, through: :reverse_of_relationships, source: :follow
  has_many :follow, through: :relationships, source: :followed
  

  attachment :image

end
