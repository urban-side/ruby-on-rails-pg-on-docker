class Task < ApplicationRecord
    belongs_to :user
    has_many :labellings, dependent: :destroy
    has_many :labels, through: :labellings

    validates :title,       presence: true
    validates :description, presence: true
    validates :status,      presence: true
    
    # 20220906追記：初期値が保存時まで効いてしまう（必須項目エラーは出すのでそちらで対応）
    # # 初期値設定（新規作成時のみなので if~ は必須）
    # after_initialize :set_default, if: :new_record?
    # private
    # def set_default
    #     self.status = 0
    # end
end
