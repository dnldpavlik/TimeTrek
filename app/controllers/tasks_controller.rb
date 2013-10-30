class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def create
        Task.create(description: create_task_params)
        redirect_to tasks_url
    end

    private 

    def create_task_params
        params.require(:description)
    end
end
