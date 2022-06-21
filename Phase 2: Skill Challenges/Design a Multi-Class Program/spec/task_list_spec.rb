require "task_list"

describe TaskList do
    it "constructs" do
        task_list = TaskList.new
        expect(task_list.incompleted).to eq []
        expect(task_list.completed).to eq []
    end
end
        