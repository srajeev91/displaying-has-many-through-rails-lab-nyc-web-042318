class DoctorsController < ApplicationController
  before_action :get_doctor, only:[:edit, :show, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    if @doctor.save
      @doctor = Doctor.new(doctor_params)
      redirect_to @doctor
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @doctor.save
      @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def get_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :department)
  end

end
