module Shmup
	class AudioManager

		def initialize window, sounds, songs
			@window = window
			@sounds = {}
			@songs = {}
			sounds.each do |s|
				@sounds[s] = Shmup.load_sample(window, s)
			end
			songs.each do |s|
				@songs[s] = Shmup.load_song(window, s)
			end
		end	

		def play_sound(name)
		end	

		def play_song(name)
		end

		def pause_song(name)
		end

		def resume_song(name)
		end

		def stop_song(name)
		end
	end
end