class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  before_save { email.downcase! }    # save前にメアドを小文字化するように
  validates :name,  presence: true, length: { maximum:50 }
  validates :email, presence: true, length: { maximum:255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
                    # uniqueness: true
                    uniqueness: { case_sensitive: false }    # 大文字小文字関係なく一致ないように制限（この時uniqunessは自動的にtrue扱い）
end
