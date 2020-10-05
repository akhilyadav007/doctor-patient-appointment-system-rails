class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def new
		@doctor= Doctor.new
	end

	def create 
		@doctor = Doctor.new(doctor_params)
		@doctor.save
		redirect_to doctors_path
  end

  def destroy
		@doctor=Doctor.find(params[:id])
		@doctor.destroy
		redirect_to doctors_path
  end  
  
  def edit
		@doctor = Doctor.find(params[:id])
	end

	def update
		@doctor = Doctor.find(params[:id])
		@doctor.update(doctor_params)
		redirect_to doctors_path
	end
  
  def doctor_params
		params.require(:doctor).permit(:name, :email, :password)
	end

end