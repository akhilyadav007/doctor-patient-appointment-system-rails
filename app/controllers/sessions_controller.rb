class SessionsController < ApplicationController


  
  def new
  end

  def create
    patient = Patient.find_by_email(params[:email])
    doctor = Doctor.find_by_email(params[:email])
    if patient && patient.authenticate(params[:password]) || doctor && doctor.authenticate(params[:password])
      if patient
        session[:patient_id] = patient.id
        redirect_to root_path, notice: "Logged in!"
      else
        session[:doctor_id] = doctor.id
        redirect_to doctors_path(doctor), notice: "Logged in"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:patien_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
