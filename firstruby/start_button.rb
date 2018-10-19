require_relative 'Button'
class StartButton < Button
  def initialize
    super("start")
  end

  def press_button
    puts "pressed the start button"
  end
end

start_button = StartButton.new
start_button.press_button