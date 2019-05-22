require 'rails_helper'

describe Student, type: :model do
  context 'attributes' do
    it 'creates attributes' do
      student_data = {
        "id": 52,
        "name": "Gormlaith Gaunt"
      }

      student = Student.new(student_data)

      expect(student.name).to eq("Gormlaith Gaunt")
      expect(student.id).to eq(52)
    end
  end
end
