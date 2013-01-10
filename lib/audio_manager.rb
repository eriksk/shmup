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
			@sounds[name].play(volume_sfx)
		end	

		def play_song(name)
			@songs[name].play(true)
		end

		def pause_song(name)
			if @songs[name].playing?
				@songs[name].pause()
			end
		end

		def resume_song(name)
			if !@songs[name].playing?
				@songs[name].play()
			end
		end

		def stop_song(name)
			if @songs[name].playing?
				@songs[name].stop()
			end
		end
	end
end