require 'pry'
def single_lists
  array = [13,25,64,23,66,11,79]
  nested_arrays = array.map { |x| [] << x }
  if array.length.odd?
    nested_arrays[0] << nested_arrays[1][0]
    nested_arrays.delete_at(1)
    nested_arrays
  end
end

def merge_sort(array1, array2)
  if array1.empty?
    array2.shift
  elsif array2.empty?
    array1.shift
  elsif array1[0] < array2[0]
    array1.shift
  else array1[0] > array2[0]
    array2.shift
  end
end

def one_round(arrays)
  while !arrays[0].empty? or !arrays[1].empty?
    return merge_sort(arrays[0], arrays[1])
  end
end

def merge(arrays)
  (arrays.count/2).times do
    array = [] << one_round(arrays)
    merge(array)
    arrays.shift
    arrays.shift
  end
end
p merge(single_lists)
