class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def new
        @projects = Project.new
    end

    def create
        @project = Project.new(project_params)
        
        if @project.save
            flash[:notice] = 'Your project has been succesfully added!'
            redirect_to projects_path # notice: 'Your project has been succesfully added!'
        else
            flash[:alert] = 'Failed to create project!'
            redirect_to new_project_path # alert: 'Failed to create project!'
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :built_with, :description, :url, :price, :owner_id)
    end

end
