module Shmup
	class PlayerController

		def initialize window
			@window = window
		end

		def update ship, dt
			if @window.button_down? Gosu::KbLeft
				ship.velocity.x -= ship.speed * dt
			end
			if @window.button_down? Gosu::KbRight
				ship.velocity.x += ship.speed * dt
			end
			if @window.button_down? Gosu::KbUp
				ship.velocity.y -= ship.speed * dt
			end
			if @window.button_down? Gosu::KbDown
				ship.velocity.y += ship.speed * dt
			end
			friction = 0.7
			ship.velocity.x *= friction
			ship.velocity.y *= friction
		end		
	end
end