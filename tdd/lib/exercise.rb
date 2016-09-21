class Array

  def my_uniq
    result = []
    self.each { |el|result << el unless result.include?(el) }
    result
  end

  def two_sum
    result = []
    self.each_with_index do |el1, idx1|

      unless el1.is_a?(Integer)
        raise "Array contains non-integer elements!"
      end

      self.each_with_index do |el2, idx2|

        unless el2.is_a?(Integer)
          raise "Array contains non-integer elements!"
        end

        result << [idx1, idx2] if el1 + el2 == 0 && idx1 < idx2
      end
    end
    result
  end

  def my_transpose
    result = []
    self.length.times do |idx|
      new_row = []
      self.each { |row| new_row << row[idx] }
      result << new_row
    end
    result
  end
end

def stockpicker(stockprices)
  profits = Hash.new{|h,k| h[k] = []}
  stockprices.each_with_index do |stockprice1, idx1|

    unless stockprice1.is_a?(Integer)
      raise "Array contains non-integer elements!"
    end

    if stockprice1 < 0
      raise "Can not contain negative stock price!"
    end

    stockprices.each_with_index do |stockprice2, idx2|

      unless stockprice2.is_a?(Integer)
        raise "Array contains non-integer elements!"
      end

      if stockprice2 < 0
        raise "Can not contain negative stock price!"
      end

      if stockprice1 < stockprice2 && idx1 < idx2
        profits[[idx1,idx2]] = stockprice2 - stockprice1
      end
    end
  end
  return [] if profits.empty?

  profits.each do |days,profit|
    return days if profit == profits.values.max
  end
end
