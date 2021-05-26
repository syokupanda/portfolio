class Contact < ApplicationRecord
  belongs_to :user

  #-------------バリデーション-----------------
  with_options presence: true do
    validates :title
    validates :category
    validates :text
  end
  #--------------------------------------------


  enum category:{
    "その他": 0,
    "生産者申請": 1,
    "不具合・修正依頼": 2
  }

  enum status:{
    "未処理": 0,
    "承認済み": 1,
    "否認": 2
  }

end
