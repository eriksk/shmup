module Shmup
	class Enemy < Ship

		def initialize image, bullet_emitters, path, enter_on
			super(image, nil, nil, bullet_emitters)
			@enter_on = enter_on
			@speed = speed
			@emitters = bullet_emitters
			@path = path
			# always start outside the screen
			@position.x = -1000
			@position.y = -1000
			@health = 10
		end

		def alive?
			!@path.done?
		end

		def dead?
			@health <= 0	
		end

		def damage damage
			@health -= damage
		end
		
		def started? stage_time
			stage_time > @enter_on
		end
		
		def update dt, stage_time
			if stage_time >= @enter_on
				@path.update dt
				@position.x = @path.position.x
				@position.y = @path.position.y
			end
		end
	end
end