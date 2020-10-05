class PatientsController < ApplicationController
   
    def show
        @patients = Patient.all
      end
    
      def new
        @patient = Patient.new
      end
    
     def create 
        @patient = Patient.new(patient_params)
        @patient.save
        redirect_to new_session_path
     end
    
      def destroy
          @patient=Patient.find(params[:id])
          @patient.destroy
          redirect_to  root_path
      end  

      def edit
          @patient = Patient.find(params[:id])
      end
      
      def update
          @patient = Patient.find(params[:id])
          @patient.update(patient_params)
          redirect_to root_path
      end
      

      private

      def patient_params
            params.require(:patient).permit(:name, :email, :age, :password)
        end
    
end
