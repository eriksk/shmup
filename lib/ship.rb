module Shmup
	class Ship < Entity

		attr_accessor :speed, :emitters

		def initialize image, controller, speed, bullet_emitters
			super(image)
			@controller = controller
			@speed = speed
			@emitters = bullet_emitters
		end

		def update dt
			@controller.update self, dt
			@position.x += @velocity.x * dt
			@position.y += @velocity.y * dt
		end		
	end
end