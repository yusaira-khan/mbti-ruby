class Personality
  def initialize
    # add all 16 personalities
  end
  def prindata
    #sort
  end
end

class TraitsList
end
class AspectsList
end
class PreferencesList
end
class Trait
  attr_reader :energy
  attr_reader :mind
  attr_reader :nature
  attr_reader :tactics
  attr_reader :role_name
  attr_reader :initials
  attr_reader :link

  def initialize
    # load data
  end

  def percentage
  end

end
class Aspect

  attr_reader :left
  attr_reader :right
  def initialize
  end

  def dominant
    #get dominant between right and left
  end

end

class Preference
  attr_accessor :opposite
  attr_accessor :percent
  attr_reader :name
  attr_reader :initials

  def initialize
    #load
  end

  def adjusted_percent
  end
  def print
  end
end
