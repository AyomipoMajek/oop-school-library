class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students << student
  end
end

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = nil
  end

  def belongs_to_classroom?(classroom)
    @classroom == classroom
  end
end
