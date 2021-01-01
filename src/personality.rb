
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
  def display_html()
    h="<table> <tr> <th>Trait</th> <th>Name</th> <th>Percent</th> </tr>"
    f="</table>"
    b=@traits.sorted.map(&:display_html).join("\n")
    h+b+f
 end

  def quick_htm!(l)
    @aspects.quick!(l)
    display_html
  end

end
