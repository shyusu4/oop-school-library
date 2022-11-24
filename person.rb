require_relative './nameable'

class Person < Nameable
  attr_accessor :id, :rentals
  attr_reader :age, :name, :parent_permission

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || of_age?

  end

  def add_rental(price)
    @rentals << price
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
