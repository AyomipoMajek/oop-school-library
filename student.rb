require_relative 'person'

class Student < Person
  def initialize(age, name = 'unknown', grade = 'unknown')
    super(age, name)
    @grade = grade
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
