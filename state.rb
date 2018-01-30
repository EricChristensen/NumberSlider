
class State

  def initialize(string_rep)
    @string_rep = string_rep
  end

  def randomize
    for i in 0..50
      random_move
    end
  end

  def move(move)
    if (move == "left\n")
      @string_rep = swap(-1)
    elsif (move == "right\n")
      @string_rep = swap(1)
    elsif (move == "up\n")
      @string_rep = swap(-3)
    elsif (move == "down\n")
      @string_rep = swap(3)
    end
    return State.new(@string_rep)
  end

  def valid_move?(move)
    if move == "left\n"
      return !(@string_rep.index('.') == 0 || @string_rep.index('.') == 3 || @string_rep.index('.') == 6)
    elsif move == "right\n"
      return !(@string_rep.index('.') == 2 || @string_rep.index('.') == 5 || @string_rep.index('.') == 8)
    elsif move == "up\n"
      return !(@string_rep.index('.') == 0 || @string_rep.index('.') == 1 || @string_rep.index('.') == 2)
    elsif move == "down\n"
      return !(@string_rep.index('.') == 6 || @string_rep.index('.') == 7 || @string_rep.index('.') == 8)
    else
      return false
    end
  end

  def swap(other_pos)
    space_index = @string_rep.index('.')
    other_index = space_index + other_pos
    other_char = @string_rep[other_index]
    @string_rep[space_index] = other_char
    @string_rep[other_index] = '.'
    @string_rep
  end

  def random_move
    moves = ["left\n", "right\n", "up\n", "down\n"]
    my_move = ""
    i = 0
    until valid_move?(my_move) do
      my_move = moves[Random.rand(4)]
    end
    move(my_move)
  end

  def win?
    return @string_rep == "12365478."
  end

  def to_string
    the_string = ""
    for pos in 0..@string_rep.length
      if pos == 3 || pos == 6 || pos == 9
        the_string += "\n"
      end
      the_string += @string_rep[pos].to_s
    end
    return the_string
  end

end
