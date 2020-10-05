require 'test_helper'

class PatientTest < ActiveSupport::TestCase

def setup
    @patient = Patient.new(name: "abcd", email: "ajk@yahoo.com", age:"12",
                     password: "1234")
end

test "should be valid" do
    assert @patient.valid?
end


test "name should be present" do
  @patient.name = ""
  assert_not @patient.valid?
end

test "email should be present" do
  @patient.email = "     "
  assert_not @patient.valid?
end

test "name should not be too long" do
  @patient.name = "a" * 51
  assert_not @patient.valid?
end

test "email should not be too long" do
  @patient.email = "a" * 244 + "@example.com"
  assert_not @patient.valid?
end

test "email addresses should be unique" do
  duplicate_patient = @patient.dup
  duplicate_patient.email = @patient.email.upcase
  @patient.save
  assert_not duplicate_patient.valid?
end

end
