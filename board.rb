
class Board

  def initialize(state)
    @state = state
    for i in 0..50
      random_move
    end
  end

  def move(move)
    if (move == "left\n")
      @state = swap(-1)
    elsif (move == "right\n")
      @state = swap(1)
    elsif (move == "up\n")
      @state = swap(-3)
    elsif (move == "down\n")
      @state = swap(3)
    end
    return true
  end

  def swap(other_pos)
    space_index = @state.index('.')
    other_index = space_index + other_pos
    other_char = @state[other_index]
    @state[space_index] = other_char
    @state[other_index] = '.'
    @state
  end

  def valid_move?(move)
    if move == "left\n"
      return !(@state.index('.') == 0 || @state.index('.') == 3 || @state.index('.') == 6)
    elsif move == "right\n"
      return !(@state.index('.') == 2 || @state.index('.') == 5 || @state.index('.') == 8)
    elsif move == "up\n"
      return  !(@state.index('.') == 0 || @state.index('.') == 1 || @state.index('.') == 2)
    elsif move == "down\n"
      return !(@state.index('.') == 6 || @state.index('.') == 7 || @state.index('.') == 8)
    else
      return false
    end
  end

  def to_string
    the_string = ""
    for pos in 0..@state.length
      if pos == 3 || pos == 6 || pos == 9
        the_string += "\n"
      end
      the_string += @state[pos].to_s
    end
    return the_string
  end

  def print_state
    puts @state
  end

  def win?
    return @state == "12365478."
  end

  def random_move
    moves = ["left\n", "right\n", "up\n", "down\n"]
    my_move = ""
    until valid_move?(my_move) do
      my_move = moves[Random.rand(4)]
    end
    move(my_move)
  end
end
