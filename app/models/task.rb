require 'taskstatus'

class Task < ActiveRecord::Base
    def self.open_flagged_tasks 
       Task.where(:status => TaskStatus.open, :flagged => true).order(:description)
    end

    def self.open_unflagged_tasks
        Task.where(:status => TaskStatus.open, :flagged => false).order(:description)
    end

    def self.open_tasks  
        Task.open_flagged_tasks + Task.open_unflagged_tasks
    end

    def self.completed_tasks()
        Task.where(status: TaskStatus.completed)
    end

    def complete
        self.status = TaskStatus.completed
        self.unflag
    end

    def uncomplete
        self.status = TaskStatus.open
    end

    def flag
        self.flagged = true
    end

    def unflag
        self.flagged = false
    end
end
