require 'test_helper'
require 'taskstatus'

class TaskTest < ActiveSupport::TestCase
    test "Create defaults" do
        taskdescription = "Test task"
        task = Task.create(description: taskdescription)
        assert task.description == taskdescription
        assert task.status == TaskStatus.open
        assert task.flagged == false
    end

    test "Complete task is completed" do
        task = Task.create(description: "Boo")
        task.complete
        assert task.status == TaskStatus.completed
    end
    
    test "Complete flagged task is completed and not flagged" do
        task = Task.create(description: "Boo")
        task.flag
        task.complete
        assert task.status == TaskStatus.completed
        assert task.flagged == false
    end

    test "Uncomplete completed task" do
        task = Task.create(description: "Boo")
        task.complete
        task.uncomplete
        assert task.status == TaskStatus.open
    end

    test "Flagging a task is flagged" do
        task = Task.create(description: "Boo")
        task.flag
        assert task.flagged
    end

    test "Unflagging a flagged task" do
        task = Task.create(description: "Boo")
        task.unflag
        assert task.flagged == false
    end
end
