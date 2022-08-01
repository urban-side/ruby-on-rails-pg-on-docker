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
    """
    @task = Task.new(
      title: "",
      description: "",
      status: 0,
      date: "", 
      priority: 0,
      label: 0, 
      user: 0
    )
    """
    # タスクフィールドにフィルタを実装したため、create時に一旦それを通すよう変更
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "タスクを新規作成しました"   # TODO: フラッシュメッセージの表示
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # タスクフィールドにフィルタを実装したため、update時にも一旦それを通すよう変更
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:notice] = "タスクを編集しました"     # TODO: フラッシュメッセージの表示
      redirect_to summary_detail_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # 303 see otherでリダイレクト（状況によってリダイレクト先は変えるべき）
    redirect_to root_path, status: :see_other
  end

  private
    def task_params
      params.require(:task).permit(
        :title,
        :description,
        :status,
        :date,
        :priority,
        :label,
        :user
      )
    end
  
end
