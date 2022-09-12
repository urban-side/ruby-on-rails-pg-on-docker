module TasksHelper
    # パラメータがDBのカラムに存在していることが前提で、ソート命令をコントローラーにかける
    def sort_order(column, title)
        direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
        link_to title, {sort: column, direction: direction}
    end

    # 必須項目以外が空欄だった場合の表示用処理
    def nil_trans(task_data, date_flag=false, priority_flag=false)
        task_data ||= ""    # nilなら空欄を返す
    
        # 日付データだったがちゃんと入っていた場合はフォーマット変換
        if date_flag && task_data != ""
            task_data = task_data.strftime('%Y.%m.%d %H:%M')
        end
        # 優先度の数字データがnilで空欄変換されていた場合は0として返す
        if priority_flag && task_data == ""
            task_data = 0
        end
        
        return task_data
    end
end
