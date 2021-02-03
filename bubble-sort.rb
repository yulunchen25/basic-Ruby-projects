# A basic program that bubble sorts a list of numbers

def bubble_sort(array)
  cycles = array.length-1
  cycles.times do
    sorted = true
    for i in 1..cycles
      if (array[i-1] <=> array[i]) == 1
        temp = array[i]
        array[i] = array[i-1]
        array[i-1] = temp
        sorted = false
      end
      p array
    end
    cycles -= 1
    break if sorted == true
  end
  array
end

p "The sorted array is #{bubble_sort([0,1,2,3,4,5])}"