# frozen_string_literal: true

# class Person to store age, name and parent permission
class Person
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    @parent_permission || is_of_age?
    false
  end
end
