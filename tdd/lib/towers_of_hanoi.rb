class TowersOfHanoi

  attr_accessor :towers

  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def move(from_tower, to_tower)

    unless from_tower.between?(0,2)
      raise "from tower doesn't exist!"
    end

    unless to_tower.between?(0,2)
      raise "to tower doesn't exist!"
    end

    if @towers[from_tower].empty?
      raise "No disk to move!"
    end

    unless @towers[to_tower].empty?
      if @towers[to_tower].last < @towers[from_tower].last
        raise "Can't place disk on smaller disk!"
      end
    end

    @towers[to_tower] << @towers[from_tower].pop
  end

  def play
    until won?
      from_tower, to_tower = get_move
      move(from_tower, to_tower)
    end
  end

  def won?
    @towers == [[],[3,2,1],[]] || @towers == [[],[],[3,2,1]]
  end
end
