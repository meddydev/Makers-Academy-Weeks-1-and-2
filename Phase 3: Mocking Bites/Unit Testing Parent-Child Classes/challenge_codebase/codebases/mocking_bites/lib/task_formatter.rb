class TaskFormatter
    def initialize(task)
        @task = task
    end
  
    def format
        case @task.complete?
        when true
            return "[x] #{@task.title}"
        when false
            return "[ ] #{@task.title}"
        end
    end
end