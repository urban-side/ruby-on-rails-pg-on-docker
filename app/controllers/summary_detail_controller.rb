class SummaryDetailController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @status = ["未着手", "進行中", "完了"]
    @priority_mark = ["", "!", "!!", "!!!"]
  end
end
