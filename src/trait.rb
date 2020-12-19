
class TraitsList
end
class Trait
  attr_reader :energy
  attr_reader :mind
  attr_reader :nature
  attr_reader :tactics
  attr_reader :role_name
  attr_reader :initials

  def link
    "https://www.16personalities.com/#{initials}-personality"
  end
  def initialize(initials:, role_name:, prefs:)
    @initials = initials
    @role_name = role_name
    @mind, @energy, @nature, @tactics = \
                             @initials.split('').map{|i| prefs.collection[i]}

  end

  def fraction
    @mind.adjust_frac * @nature.adjust_frac * @energy.adjust_frac * @tactics.adjust_frac
  end

end
