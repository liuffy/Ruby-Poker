require_relative 'hand'

class Player
  attr_reader :name, :pot, :hand, :active

  def initialize(name, pot)
    @name = name
    @pot = pot
    @hand = Hand.new
  end

  def play_turn
    case get_action
    when "f"
      @active = false
    when "r"
      raise_amount = get_raise_amount
      make_raise(raise_amount)
    else
    end
    if @active == true
      discard_cards = get_discard_cards
      discard_cards.each do |card_index|
        @hand.discard_card(card_index)
      end
    end
  end

  def get_action
    render
    puts "What would you like to do?"
    puts "Options: f = 'fold'"
    puts "Options: s = 'see'"
    puts "Options: r = 'raise'"

    action = gets.chomp.downcase

    raise InputError.new("Not valid action!") unless "fsr".include?(action)
    action
    rescue InputError => e
      puts e.message
      sleep(2)
      retry
    end
  end



  def get_discard_cards
    render
    cards_to_discard = []

    puts "Which card would you like to discard?"
    discard_card = gets.chomp

    if discard_card.to_i == 0 && discard_card != "0"
      raise InputError.new("Please enter an integer value")
    end

    unless discard_card.to_i.between?(1,5)
      raise InputError.new("Please choose a number between 1 and 5")
    end 
  end

  def get_raise_amount
    render
    puts "How much would you like to raise?"
    amount = gets.chomp

    if amount.to_i == 0 && amount != "0"
      raise InputError.new("Please enter an integer value")
    end
    amount = amount.to_i
    raise InputError.new("You don't have enough chips") if amount > @pot

    amount

    rescue InputError => e
      puts e.message
    retry
  end

  private

  def render
    system('clear')
    (0..4).each {|idx| puts @hand[idx].to_s}
  end

  def make_raise(amount)
    @pot -= amount
  end

end

class InputError < StandardError

  attr_reader :message

  def initialize(message)
    @message = message
  end

end
