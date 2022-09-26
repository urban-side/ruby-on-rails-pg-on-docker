class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  before_save { email.downcase! }    # save前にメアドを小文字化するように
  validates :name,  presence: true, length: { maximum:50 }
  validates :email, presence: true, length: { maximum:255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
                    # uniqueness: true
                    uniqueness: { case_sensitive: false }    # 大文字小文字関係なく一致ないように制限（この時uniqunessは自動的にtrue扱い）
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 管理ユーザーが0人になる際は更新・削除はできない
  before_update :cannot_update_admin
  before_destroy :cannot_delete_admin
  private
    def cannot_update_admin
      throw :abort if User.where(admin: true).count == 1 && self.admin_change_to_be_saved == [true, false]
    end

    def cannot_delete_admin
      throw :abort if User.where(admin: true).count == 1 && self.admin == true
    end
end
