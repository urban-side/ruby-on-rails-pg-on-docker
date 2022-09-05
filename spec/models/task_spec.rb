require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'model test' do
    context 'normal condition' do
      # 仕様書通りのデータが validation をパスするかどうか
      it 'can pass validation with right-data' do
        expect(build(:task)).to be_valid
      end
    end
    
    context 'Abnormal condition' do
      # title がないデータはエラーを返すかどうか
      it 'reject validation and return error-message without title data' do
        task = build(:task, title: nil)
        task.valid?
        expect(task.errors[:title]).to include("必須項目です")
      end

      # description がないデータはエラーを返すかどうか
      it 'reject validation and return error-message without description data' do
        task = build(:task, description: nil)
        task.valid?
        expect(task.errors[:description]).to include("必須項目です")
      end

      # status がないデータはエラーを返すかどうか
      it 'reject validation and return error-message without status data' do
        task = build(:task, status: nil)
        task.valid?
        expect(task.errors[:status]).to include("必須項目です")
      end
    end
  end

  describe "#search" do
    before do
      @task0 = create(:task, title: "task1", status: 0)
      @task1 = create(:task, title: "テスト", status: 1)
      @task2 = create(:task, title: "task2", status: 2)
    end

    context "対応するデータがある場合" do
      it "検索タイトルを含むデータを返すこと" do
        q = Task.ransack(title_cont: "task")
        expect(q.result).to include @task0, @task2
      end

      it "検索進捗と一致する配列を返すこと" do
        q = Task.ransack(status_eq: 1)
        expect(q.result).to eq [@task1]
      end
      
      it "タイトル・進捗のAND検索に対応する配列を返すこと" do
        q = Task.ransack(title_cont: "task", status_eq: 2)
        expect(q.result).to eq [@task2]
      end
    end

    context "対応するデータがない場合" do
      it "検索窓が初期状態の場合、全データを返すこと" do
        q = Task.ransack(title_cont: "")
        expect(q.result).to include @task0, @task1, @task2
      end

      it "空の配列を返すこと" do
        q = Task.ransack(title_cont: "この名前は存在しないはずです", status_eq: 1)
        expect(q.result).to eq []
      end
    end
  end
  
end
