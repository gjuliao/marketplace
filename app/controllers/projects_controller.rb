class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def create
        owner = current_user
        @project = Project.new(project_params.merge(owner_id: owner))

        if @project.save?
            redirect_to projects_path, notice: 'Your project has been succesfully added!'
        else
            flash.now[:alert] = 'Failed to create project'
            render :new
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :built_with, :description, :url)
    end

end
