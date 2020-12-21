def create_traitrow_converter_with_preference(prefs)
  proc { |row|
    [row['initials'],
     Trait.new(initials: row['trait'],
               role_name: row['role_name'],
               prefs: prefs)]
  }
end
class TraitsList
  attr_reader :collection
  def initialize(p)
    table = CSV.parse(File.read('./data/trait.csv'), headers: true)
    convert_row = create_traitrow_converter_with_preference(p)
    @collection = Hash[table.map(&convert_row)]
  end
end
class Trait
  attr_reader :energy
  attr_reader :mind
  attr_reader :nature
  attr_reader :tactics
  attr_reader :role_name
  attr_reader :initials

  def link
    "https://www.16personalities.com/#{@initials}-personality"
  end

  def initialize(initials:, role_name:, prefs:)
    @initials = initials
    @role_name = role_name
    @mind, @energy, @nature, @tactics = \
      @initials.split('').map do |i|
        prefs.collection[i]
      end
  end

  def fraction
    @mind.adjust_frac * @nature.adjust_frac * @energy.adjust_frac * @tactics.adjust_frac
  end
end
