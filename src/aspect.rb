require 'csv'

class Aspect
  attr_reader :left
  attr_reader :right
  attr_reader :name
  attr_reader :link
  def initialize(name:, l:, r:, link:)
    @name = name
    @left = l
    @right = r
    @link = link
  end

  def dominant
    if @left.fraction >= @right.fraction
      @left
    else
      @right
    end
  end
  def set_left_percentage(per)
    @left.sync_percent(per)
  end
end

class AspectsRepository
  attr_reader :collection
  def initialize(p)
    table = CSV.parse(File.read('./data/aspect.csv'), headers: true)
    convert_row = create_row_converter_with_preference(p)
    @rowssorder = table.map{ |r| r['name'] }
    @collection = Hash[table.map(&convert_row)]
  end

  def set_all_left_percentage (l):
      @row_order.each_with_index do |n,i|
        @collection[n].set_percent l[i]
      end
  end

end

def create_row_converter_with_preference(prefs)
  proc { |row|
    [row['name'],
     Aspect.new(name: row['name'],
                link: row['link'],
                l: prefs.collection[row['left']],
                r: prefs.collection[row['right']])]
  }
end
