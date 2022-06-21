require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour

  it "returns 2 tasks in a list when 2 tasks added " do
    task_list = TaskList.new
    task = double :fake_task
    task2 = double :fake_task
    task_list.add(task)
    task_list.add(task2)
    expect(task_list.all).to eq [task, task2]
  end

  it "returns true for 2 completed task" do
    task_list  =TaskList.new
    task = double :fake_task, complete?: true
    task_list.add(task)
    task2 = double :fake_task, complete?: true
    task_list.add(task2)
    expect(task_list.all_complete?).to eq true
  end

  it "returns false for 1 completed and 1 not completed task" do
    task_list  =TaskList.new
    task = double :fake_task, complete?: false
    task_list.add(task)
    task2 = double :fake_task, complete?: true
    task_list.add(task2)
    expect(task_list.all_complete?).to eq false
  end
end