require 'gosu'

class GameWindow < Gosu::Window
    def initialize
        super(250, 100, fullscreen: false)
        @font = Gosu::Font.new(24)
        @axis = [0,0]
    end

    def update
        @axis[0] = Gosu.axis(Gosu::GP_LEFT_STICK_X_AXIS)
        @axis[1] = Gosu.axis(Gosu::GP_LEFT_STICK_Y_AXIS)
        if @axis[0].abs < 0.3 and @axis[1].abs < 0.3
            @axis[0] = 0
            @axis[1] = 0
        end

        val_x = 50 * @axis[0]
        val_y = 50 * @axis[1]
        success = system("fish", "-c", "xdotool mousemove_relative -- #{val_x} #{val_y}")
    end

    def draw
        @font.draw_text("Current axis:\n#{@axis[0]}\n#{@axis[1]}", 5, 5, 2)
    end
end

window = GameWindow.new
window.show
