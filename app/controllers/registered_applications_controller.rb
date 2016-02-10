class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_applications = RegisteredApplication.new
  end

  def create
    @registered_applications = RegisteredApplication.new(registered_applications_params)

    if @registered_applications.save
      redirect_to @registered_applications, notice: "Application was registered successfully."
    else
      flash[:error] = "Error registering application. Please try again."
      render :new
    end
  end

  def show
    @registered_applications = RegisteredApplication.find(params[:id])
  end

  def edit
    @registered_applications = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_applications = RegisteredApplication.find(params[:id])
    @registered_applications.assign_attributes(registered_applications_params)

    if @registered_applications.save
      flash[:notice] = "Registered application was updated."
      redirect_to @registered_applications
    else
      flash[:error] = "Error saving registered application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_applications = RegisteredApplication.find(params[:id])

    if @registered_applications.destroy
      flash[:notice] = "\"#{@registered_applications.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash[:error] = "There was an error deleting the registered application."
      render :show
    end
  end
end

private

def registered_applications_params
  params.require(:registered_application).permit(:name, :url)
end
