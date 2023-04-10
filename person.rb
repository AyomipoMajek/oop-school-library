class Person
  attr_accessor :age
  attr_reader :id, :name

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def name=(new_name)
    @age = new_name
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  # person.rb:22:7: C: Naming/PredicateName: Rename is_of_age? to of_age?.
  def of_age?
    @age >= 18
  end
end
