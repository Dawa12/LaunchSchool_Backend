class Triangle
  attr_accessor :triangle

  def initialize(rows)
    @triangle = rows
  end

  def rows
    arr = []
    arr << [1] if triangle >= 1
    arr << [1, 1] if triangle >= 2
    arr << [1, (arr.last.reduce(:+)), 1] if triangle >= 3
    if triangle >= 4
      (triangle - 3).times do |_|
        arr << new_arr(arr)
      end
    end

    arr
  end

  def new_arr(arr)
    temp = []  
    arr.last.each_with_index do |num, index|
      if num == 1
        temp << 1
      elsif index == 1
        temp << arr.last[index] + arr.last[index-1]
        temp << arr.last[index] + arr.last[index+1]
      else
        temp << arr.last[index] + arr.last[index+1]
      end
    end

    temp
  end
end
