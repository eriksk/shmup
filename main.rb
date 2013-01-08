require 'gosu'
require './conf'
require './lib/game'

module Shmup
	class GameWindow < Gosu::Window
		def initialize
			super(WIDTH, HEIGHT, FULLSCREEN)
			self.caption = TITLE

			@game = Game.new(self)
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