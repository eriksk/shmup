module Shmup
	class Ship < Entity

		attr_accessor :speed

		def initialize image, controller, speed
			super(image)
			@controller = controller
			@speed = speed
		end

		def update dt
			@controller.update self, dt
			@position.x += @velocity.x * dt
			@position.y += @velocity.y * dt
		end		
	end
end