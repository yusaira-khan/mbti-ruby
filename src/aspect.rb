
class Aspect

  attr_reader :left
  attr_reader :right
  attr_reader :name
  attr_reader :link
  def initialize (name:,l:,r:,link:)
    @name = name
    @left = l
    @right = r
    @link = link
  end

  def dominant
    #get dominant between right and left
  end

end

class AspectsCollection
end
