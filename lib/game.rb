module Shmup
	class Game

		def initialize window
			@window = window
			@audio_manager = AudioManager.new(window, [
					"laser"	
				],
				[
					"song1",
					"song2",
					"song3",
					"song4",
					"song5",
					"song7"
				])
			@audio_manager.play_song("song1")
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