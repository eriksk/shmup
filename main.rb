require 'gosu'
require './conf'
require './lib/vec2'
require './lib/helpers'
require './lib/game'
require './lib/entity'
require './lib/bullet'

module Shmup
	class GameWindow < Gosu::Window
		def initialize
			super(WIDTH, HEIGHT, FULLSCREEN)
			self.caption = TITLE

			@game = Game.new(self)
		end
		
		def button_down(id)
			case id
				when Gosu::KbEscape
					if DEBUG
						self.close
					end
			end
		end
		
		def update
			dt = 16.0
			@game.update dt
		end
		
		def draw
			@game.draw
		end
	end
end

game_window = Shmup::GameWindow.new
game_window.show