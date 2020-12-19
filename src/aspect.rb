require 'csv'

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
  attr_reader :collection
  def initialize(p)
    table = CSV.parse(File.read('./data/aspect.csv'), headers: true)
    convert_row = create_row_converter_with_preference(p)
    @collection = Hash[table.map(&convert_row)]
  end
end

def create_row_converter_with_preference(prefs)
  Proc.new { |row| [row['name'],
                    Aspect.new(name: row['name'],
                               link: row['link'],
                               l: prefs.collection[row['left']],
                               r: prefs.collection[row['right']]
                              )]}
end
