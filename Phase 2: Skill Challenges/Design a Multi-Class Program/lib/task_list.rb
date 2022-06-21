class TaskList
    def initialize
        @tasks = []
    end

    def add(task)
        @tasks.push(task)
    end

    def incompleted
        @tasks.select {|task| !task.done?}
    end

    def completed
        @tasks.select {|task| task.done?}
    end
end