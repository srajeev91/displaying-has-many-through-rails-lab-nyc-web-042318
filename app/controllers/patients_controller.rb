class PatientsController < ApplicationController
  before_action :get_patient, only:[:edit, :show, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    if @patient.save
      @patient = Patient.new(patient_params)
      redirect_to @patient
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @patient.save
      @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private

  def get_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :age)
  end
end
