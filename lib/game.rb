module Shmup
	class Game

		def initialize window
			@window = window

			@stage = StageLoader.load(window, "stage1")
		end

		def update dt
			@stage.update dt
		end
		
		def draw
			@stage.draw
		end
	end
end