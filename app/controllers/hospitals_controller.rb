class HospitalsController < ApplicationController
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
