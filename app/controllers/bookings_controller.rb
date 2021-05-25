class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @hospital = Hospital.find(params[:hospital_id])

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @hospital = Hospital.find(params[:hospital_id])
    if current_user.already_booked_slot
     redirect_to booking_path(current_user.booking)
    else
      if @booking.save
        @booking.hospital.subtract_one_slot
        redirect_to booking_path(@booking)
      else
        render "new"
      end
    end
  end

  def edit 
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking
    else
      render "edit"
    end
  end

  def destroy
    @booking= Booking.find(params[:id])
    @booking.destroy
    @booking.hospital.add_one_slot
    redirect_to hospitals_path
  end
  
  def show
    @booking = Booking.find(params[:id])
  end 

  private

  def booking_params
    params.require(:booking).permit(:date, :hospital_id)
  end

end
