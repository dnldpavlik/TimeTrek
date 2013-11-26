class TasksController < ApplicationController
    before_action :find_task, except: [:index, :create]
    after_action :save_task, only: [:complete, :uncomplete, :flag, :unflag]

    def index
        @tasks = Task.open_tasks
        @completed_taks = Task.completed_tasks
    end

    def create
        Task.create!(description: create_task_params)
        redirect_to_task_list
    end

    def destroy
        @task.destroy
        redirect_to_task_list
    end

    def complete
        @task.complete
        redirect_to_task_list
    end

    def uncomplete
        @task.uncomplete
        redirect_to_task_list
    end

    def flag 
        @task.flag
        redirect_to_task_list
    end
    
    def unflag
        @task.unflag
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
