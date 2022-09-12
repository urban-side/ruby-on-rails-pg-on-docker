require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    before do
      # FactoryBotで登録
      @task0 = create(:task, title: "aaa", date: "2022-01-01 10:00:00", priority: 3, created_at: "2010-01-01 10:00:00")
      @task1 = create(:task, title: "テスト", date: "2022-02-02 10:00:00", priority: 1, created_at: "2000-01-01 10:00:00")
      @task2 = create(:task, title: "XXX", date: "2022-03-03 10:00:00", priority: 2, user: nil, created_at: "2020-01-01 10:00:00")
    end
    
    it "success the access" do
      get root_path
      expect(response).to be_successful
    end
    
    it "sorted by title" do
      get root_path, params: {direction: 'asc', sort: 'title'}
      # binding.pry
      expect(
        controller.instance_variable_get('@tasks')
      ).to eq [@task2, @task0, @task1]
    end

    it "sorted by created-at date" do
      get root_path, params: {direction: 'asc', sort: 'created_at'}
      # binding.pry
      expect(
        controller.instance_variable_get('@tasks')
      ).to eq [@task1, @task0, @task2]
    end

    it "sorted by deadline date" do
      get root_path, params: {direction: 'asc', sort: 'date'}
      # binding.pry
      expect(
        controller.instance_variable_get('@tasks')
      ).to eq [@task0, @task1, @task2]
    end

    it "sorted by priority" do
      get root_path, params: {direction: 'asc', sort: 'priority'}
      # binding.pry
      expect(
        controller.instance_variable_get('@tasks')
      ).to eq [@task1, @task2, @task0]
    end
  end

  describe "GET /task" do
    before do
      @nill_data = create(:task, date: nil, priority: nil, user: nil, label: nil)
    end
    
    it "success the access for not full data" do
      get task_path(@nill_data)
      expect(response).to be_successful
    end
  end
  
end
