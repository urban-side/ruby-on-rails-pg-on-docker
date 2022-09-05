class TasksController < ApplicationController
  
  helper_method :sort_direction, :sort_column

  def index
    @tasks = Task.all.order("#{sort_column} #{sort_direction}")
    @status = ["未着手", "進行中", "完了"]
    @priority_mark = ["", "!", "!!", "!!!"]
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
      redirect_to root_path
      flash[:notice] = "タスクを新規作成しました"
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
      redirect_to task_path(@task)
      flash[:notice] = "タスクを編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # 303 see otherでリダイレクト（状況によってリダイレクト先は変えるべき）
    redirect_to root_path, status: :see_other
    flash[:notice] = "タスクを削除しました"
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

    # 昇順・降順選択、params[:direction]に値がなければ [昇順] をデフォで返す
    def sort_direction 
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
    # sort対象の列を選択、ソート対象が見つからなければ [id] でソート
    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
end