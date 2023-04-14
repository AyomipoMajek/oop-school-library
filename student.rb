require_relative 'person'

class Student < Person
  def initialize(age, name = 'Unknown', grade = 'Unknown')
    super(age, name, grade)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
