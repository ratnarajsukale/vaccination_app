class HospitalsController < ApplicationController
  before_action :authenticate_staff, only:[:new, :create, :edit, :update, :destroy]

  def authenticate_staff
    unless current_user && current_user.staff?
      redirect_to hospitals_path, danger: "You are not authenticated user for requested task!!"   
    end
  end

  def index
    @hospitals = Hospital.all
  end

  def show
    @hospital = Hospital.find(params[:id])
  end 
  
  def new 
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to @hospital
    else
      redirect_to hospitals_new_path
    end
  end

  def edit 
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])

    if @hospital.update(hospital_params)
      redirect_to @hospital
    else
      redirect_to hospitals_edit_path
    end
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy

    redirect_to root_path
  end

  private

  def hospital_params
    params.require(:hospital).permit(:name, :address, :slots)
  end
end
