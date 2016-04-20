# spec/models/user_spe.rb
require 'spec_helper'

describe Student do
    it "is valid with a UIN, name, and email" do
        student = Student.create(
            uin: '000000000',
            name: 'Ha',
            email: 'student@tamu.edu')
        expect(student).to be_valid
    end
end