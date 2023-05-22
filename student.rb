require_relative 'person'

class Student < Person
  def initialize(age, name = 'unknown', grade = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @grade = grade
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
