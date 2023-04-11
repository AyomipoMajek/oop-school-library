require_relative 'nameable'

class Decorator < Nameable
  def initialize(nameable)
    super(nameable.age, nameable.parent_permission, nameable.name)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
