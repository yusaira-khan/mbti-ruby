
class Personality
  def initialize
    @prefs = PreferencesRepository.new
    @aspects = AspectsRepository.new @prefs
    @traits = TraitsRepository.new @prefs
  end

  def quick!(l)
    @aspects.quick!(l)
    display
  end
  def display()
    @traits.sorted.map(&:display).join("\n")
  end
end
