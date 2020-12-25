

def sanitize_per(s)
  i = s.to_i
 if not i.between(0,100)
   raise 'out of range'
 end
 i
end

def  sanitize_frac(s)
  f = s.to_f
  if not i.between(0.0,1.0)
    raise 'out of range'
  end
  f
end
