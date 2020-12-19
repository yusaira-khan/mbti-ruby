
class TraitsList
end
class Trait
  attr_reader :energy
  attr_reader :mind
  attr_reader :nature
  attr_reader :tactics
  attr_reader :role_name
  attr_reader :initials
  attr_reader :link

  def initialize(initials:, role_name:)
    @initials = initials
    @role_name = role_name
    @mind, @energy, @nature, @tactics = @initials.split('')

  end

  def percentage
  end

end
