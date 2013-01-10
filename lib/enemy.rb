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
		end

		def alive?
			if stage_time >= @enter_on 
				if @path.done?
					false
				else
					true
				end
			end
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