# Test arrays
a1 = [17, 3, 6, 9, 15, 8, 6, 1, 10]
a2 = [3, 2, 2, 1, 2, 5, 3, 4, 2]
a3 = [6, 2, 4, 1]
a4 = [4, 2, 1]

def stock_picker(arr)
  if strict_decrease?(arr)
    arr = []
    p "#{arr}, do not buy"
  else
    # pick best option
  end
end

def strict_decrease?(arr)
  arr.each_cons(2).all? { |a, b| (a <=> b) >= 0 }
end