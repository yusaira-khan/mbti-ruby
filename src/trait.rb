require 'csv'
require 'percent'
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
  def sorted
    @collection.values.sort
  end
end
class Trait
  attr_reader :role_name
  attr_reader :initials

  def link
    "https://www.16personalities.com/#{@initials}-personality"
  end

  def initialize(initials:, role_name:, relevant_prefs:)
    @initials = initials
    @role_name = role_name
    @prefs =  relevant_prefs

  end

  def nature
    @prefs[1]
  end
  def energy
    @prefs[0]
  end
  def nature
    @prefs[2]
  end
  def tactics
    @prefs[3]
  end
  def fraction
    @prefs.map(&:adjust_frac).reduce(:*)
  end
  def display_percent
    display_per fraction
  end

  def display()
    "#{@initials.upcase}(#{@role_name}): #{display_percent}"
  end

  def <=> (other)
    self.fraction <=> other.fraction
  end

end
