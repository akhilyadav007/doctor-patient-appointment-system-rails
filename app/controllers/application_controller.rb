class ApplicationController < ActionController::Base
 

  helper_method :current_patient
  def current_patient
    if session[:patient_id]
      @current_patient ||= Patient.find(session[:patient_id])
    else
      @current_patient = nil
    end
  end
  
  helper_method :current_doctor
  def current_doctor
    if session[:doctor_id]
      @current_doctor ||= Doctor.find(session[:doctor_id])
    else
      @current_doctor = nil
    end
  end

end
