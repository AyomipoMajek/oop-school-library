require_relative 'person'

class Student < Person
  def initialize(age, parent_permission, name = 'unknown', grade = 'unknown')
    super(age, name)
    @grade = grade
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
