require 'gosu'
require 'json'

require './conf'
require './lib/vec2'
require './lib/helpers'
require './lib/game'
require './lib/entity'
require './lib/bullet'
require './lib/bullet_emitter'
require './lib/player_controller'
require './lib/ship'
require './lib/enemy'
require './lib/ship_path'

require './lib/stage'
require './lib/stage_loader'
require './lib/audio_manager'

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
			draw_quad(
				0, 0, BACKGROUND_COLOR,
				WIDTH, 0, BACKGROUND_COLOR,
				WIDTH, HEIGHT, BACKGROUND_COLOR,
				0, HEIGHT, BACKGROUND_COLOR
			)
			@game.draw
		end
	end
end

game_window = Shmup::GameWindow.new
game_window.show
