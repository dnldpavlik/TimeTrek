class TasksController < ApplicationController
    def index
        @tasks = Task.where(:status => "Open").order(:description)
        @completed_taks = Task.where(status: "Completed")
    end

    def create
        Task.create(description: create_task_params, status: "Open")
        redirect_to tasks_url
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy

        redirect_to tasks_url
    end

    def complete
        Task.update_all({status: "Completed"}, {id: params[:task_ids]})
        redirect_to tasks_url
    end

    private 

    def create_task_params
        params.require(:description)
    end
end
