class AppointmentsController < ApplicationController
      
    
        def index 
           if params[:doctor_id].present?
            @doctor = Doctor.find_by(id: params[:doctor_id])
            @appointments = @doctor.appointments.all
        elsif params[:patient_id].present?
            @patient = Patient.find_by(id: params[:patient_id])
            @appointments = @patient.appointments.all
        end
        end
    
        def show
            @patient = Patient.find_by(id: params[:patient_id])
            @appointments = @patient.appointments.all
        end

        def new
            @patient = Patient.find(params[:patient_id])
            @appointment = @patient.appointments.new
        end
    
        def create 
            @patient = Patient.find(params[:patient_id])
            @appointment = @patient.appointments.new(appointment_params)
            @appointment.save
            redirect_to patient_appointments_path
        end
            
        def edit
            @appointment = Patientappointment.find(params[:id])
        end
    
        def update
            @appointment = Patient.appointment.find(params[:id])
            @appointment.update(appointment_params)
            redirect_to patient_appointments_path
        end
    
        def destroy
            @appointment =Patient.appointment.find(params[:id])
            @appointment.destroy
            redirect_to patient_appointments_path
        end    
    
        private
                
        
    
        def appointment_params
            params.require(:appointment).permit(:doctor_id, :patient_id, :appoitmentdate)
        end
    
  
    

end
