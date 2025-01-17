class Patient < ApplicationRecord
    has_many :appointments
    has_many :doctors, through: :appointments
    has_secure_password

    validates :email, presence: true, uniqueness: true
end

