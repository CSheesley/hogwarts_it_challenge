class Student
    attr_reader :name, :id

  def initialize(student_data)
    @name = student_data[:name]
    @id = student_data[:id]
  end

end
