require 'csv'
def create_traitrow_converter_with_preference(prefs)
  proc do |row|
    trait_initials = row['trait']
    aspect = trait_initials.split('').map do |i|
      prefs.collection[i]
    end
    [trait_initials,
     Trait.new(initials: trait_initials,
               role_name: row['role'],
               relevant_prefs: aspect)]
  end
end
class TraitsRepository
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

  def initialize(initials:, role_name:, relevant_prefs:)
    @initials = initials
    @role_name = role_name
    @mind, @energy, @nature, @tactics = relevant_prefs
  end

  def fraction
    @mind.adjust_frac * @nature.adjust_frac * @energy.adjust_frac * @tactics.adjust_frac
  end
end
