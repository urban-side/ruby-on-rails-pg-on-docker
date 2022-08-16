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
end
