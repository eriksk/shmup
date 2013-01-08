module Shmup
	class Bullet < Entity

		def initialize image, duration
			super(image)
			@duration = duration
		end

		def alive?
			@duration > 0.0
		end

		def update dt
			@duration -= dt
		end		
	end
end