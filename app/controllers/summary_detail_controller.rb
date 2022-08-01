class SummaryDetailController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @status = ["未着手", "進行中", "完了"]
    @priority_mark = ["", "!", "!!", "!!!"]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      title: "",
      description: "",
      status: 0,
      date: "", 
      priority: 0,
      label: 0, 
      user: 0
    )

    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

end
