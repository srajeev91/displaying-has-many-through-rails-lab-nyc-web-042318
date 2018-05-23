class AppointmentsController < ApplicationController
  before_action :get_appointment, only:[:edit, :show, :update, :destroy]

  def new
    @appointment = Appointment.new
  end

  def create
    if @appointment.save
      @appointment = Appointment.new(appointment_params)
      redirect_to @appointment
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @appointment.save
      @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def get_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_datetime, :patient, :doctor)
  end

end
