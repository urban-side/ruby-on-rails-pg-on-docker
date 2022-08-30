require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    before do
      # FactoryBotで登録
      create(:task)
    end
    
    it do
      get root_path
      # 登録したデータとここで作ったActiveRecordインスタンスが同じならOK
      # !!! ：細かい参照方法（配列だから要素で指定、key-value関係の可能性など）が不明なんで、おそらくエラー出ると思います
      expect(
        controller.instance_variable_get('@user')
      ).to eq build(:task)
    end
  end
end
