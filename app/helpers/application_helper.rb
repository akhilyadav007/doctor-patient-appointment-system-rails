module ApplicationHelper
    def doctor
        @doctors = Doctor.all
    end
    
end
