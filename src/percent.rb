def adjust_to_fraction(num)
  num / 100.0
end

def max_fraction
  1.0
end

 def display_per(frac)
  "#{format('%.2f', (frac * 100))}%"
end
