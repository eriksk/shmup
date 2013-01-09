module Shmup
	class Enemy < Ship

		def initialize image, bullet_emitters, path, enter_on
			super(image, nil, nil, bullet_emitters, path, enter_on)
			@enter_on = enter_on
			@speed = speed
			@emitters = bullet_emitters
			@path = path
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
			end
		end
	end
end