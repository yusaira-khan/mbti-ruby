#:require 'csv'
def adjust_to_fraction(num)
     num/100.0
end
def max_fraction
      1.0
end
def display_per frac
  "#{'%.2f' % (frac*100)}%"
end
class Preference
  attr_accessor :opposite
  attr_reader :name
  attr_reader :initial
  attr_writer :fraction

  def initialize (name:, initial:)
    @name = name
    @initial = initial
    @fraction = 0.0
  end

  def sync_percent (per)
    @fraction = adjust_to_fraction per
    opposite.fraction = max_fraction - @fraction

  end
  def adjust_frac
    (@fraction + 0.005)/1.01
  end
  def display_adjusted_percent
    display_per adjust_frac
  end
  def display_percent
    display_per @fraction
  end
  def as_formatted_text
    "#{@name}(#{@initial.upcase}): #{display_adjusted_percent}"
  end
end

class PreferencesList
end
