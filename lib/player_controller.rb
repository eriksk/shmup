module Shmup
	class PlayerController

		def initialize window
			@window = window
		end

		def update ship, dt
			if @window.button_down? Gosu::KbLeft
				ship.position.x -= ship.speed * dt
			end
			if @window.button_down? Gosu::KbRight
				ship.position.x += ship.speed * dt
			end
			if @window.button_down? Gosu::KbUp
				ship.position.y -= ship.speed * dt
			end
			if @window.button_down? Gosu::KbDown
				ship.position.y += ship.speed * dt
			end
		end		
	end
end