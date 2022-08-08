class Task < ApplicationRecord
    validates :title,       presence: true
    validates :description, presence: true
    validates :status,      presence: true
    
    # 初期値設定（新規作成時のみなので if~ は必須）
    after_initialize :set_default, if: :new_record?
    private
    def set_default
        self.status = 0
    end
end
