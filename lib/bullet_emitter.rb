module Shmup
	class BulletEmitter

		attr_accessor :count, :interval, :angle, :angle_diff, :wait, :repeat

		def initialize window, count, interval, angle, angle_diff, wait, repeat, speed
			@window = window
			@count = count
			@interval = interval
			@angle = angle
			@angle_diff = angle_diff
			@wait = wait
			@repeat = repeat
			@speed = speed
			reset()
		end

		def reset
			@current_wait = 0
			@current_interval = 0
			@current_repeat = 0
		end

		def fire index, bullets, x, y
			bullets << Bullet.new(Shmup.load_image(@window, 'bullet_blue'), 1000)
				.set_position(x, y)
				.set_velocity(Math::cos(@angle + (@angle_diff * index)) * @speed,
							  Math::sin(@angle + (@angle_diff * index)) * @speed)
		end
		
		def update owner, bullets, dt
			if @current_wait < @wait
				if @current_repeat < @repeat
					@current_interval += dt
					if @current_interval < @interval
						@current_interval = 0.0
						@count.times{ |i|
							fire(i, bullets, owner.position.x, owner.position.y)
						}
						@current_repeat += 1
					end
				else
					reset()
				end
			end
		end		
	end
end