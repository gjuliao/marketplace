class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
        owner = @project.owner_id
        @owner = User.find(owner)
    end

    def new
        @current_user = current_user
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

    # def project_owner_params
    #     @project = Project.find(params[:id])
    #     @owner = @project.owner_id
    # end

end
