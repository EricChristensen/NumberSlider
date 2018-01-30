require './state'

class Board

  def initialize(state)
    @state = State.new(state)
    @state.randomize
  end

  def move(move)
    @state.move(move)
  end

  def valid_move?(move)
    return @state.valid_move?(move)
  end

  def to_string
    @state.to_string
  end

  def print_state
    puts @state
  end

  def win?
    return @state.win?
  end
end
