
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
    @left.opposite = r
    @right.opposite = l
  end

  def dominant
    if @left.fraction >= @right.fraction
      @left
    else
      @right
    end
  end

end

class AspectsCollection
end
