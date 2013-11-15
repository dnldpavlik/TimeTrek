class TasksController < ApplicationController
    before_action :find_task, except: [:index, :create]
    after_action :save_task, only: [:complete, :uncomplete, :flag, :unflag]

    def index
        flagged_tasks = Task.where(:status => "Open", :flagged => true).order(:description)
        unflagd_tasks = Task.where(:status => "Open", :flagged => false).order(:description)
        @tasks = flagged_tasks + unflagd_tasks
        
        @completed_taks = Task.where(status: "Completed")
    end

    def create
        Task.create!(description: create_task_params, status: "Open", flagged: false)
        redirect_to_task_list
    end

    def destroy
        @task.destroy
        redirect_to_task_list
    end

    def complete
        @task.status = "Completed"
        @task.flagged = false
        redirect_to_task_list
    end

    def uncomplete
        @task.status = "Open"
        redirect_to_task_list
    end

    def flag 
        @task.flagged = true
        redirect_to_task_list
    end
    
    def unflag
        @task.flagged = false
        redirect_to_task_list
    end

    private 

    def create_task_params
        params.require(:description)
    end

    def redirect_to_task_list
        redirect_to tasks_url
    end

    def find_task
        @task = Task.find(params[:task_id])

        if @task == nil
            redirect_to_task_list
        end
    end

    def save_task
        @task.save
    end
end
