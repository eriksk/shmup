module Shmup
	class BulletEmitter

		attr_accessor :count, :interval, :angle, :angle_diff, :wait, :repeat, :angle_add, :texture_name

		def initialize window, opts = {}
			opts = {
				:count => 1,
				:interval => 200, 
				:angle => 0.0,
				:angle_diff => 0.0,
				:wait => 500.0,
				:repeat => 1,
				:speed => 0.1,
				:angle_add => 0.0,
				:texture => "bullet_blue",
				:offset => Vec2.new
			}.merge(opts)
			@window = window
			@count = opts[:count]
			@interval = opts[:interval]
			@angle = opts[:angle].to_radians
			@angle_default = @angle
			@angle_diff = opts[:angle_diff].to_radians
			@wait = opts[:wait]
			@repeat = opts[:repeat]
			@speed = opts[:speed]
			@angle_add = opts[:angle_add].to_radians
			@texture_name = opts[:texture]
			@offset = opts[:offset]
			reset()
		end

		def reset
			@current_wait = 0.0
			@current_interval = 0
			@current_repeat = 0
			@angle = @angle_default
		end

		def fire index, bullets, x, y
			# TODO: pool bullets, wait until performance is crap
			angle = @angle + (@angle_diff * index)
			bullets << Bullet.new(Shmup.load_image(@window, @texture_name), 1000)
				.set_position(x, y)
				.set_velocity(Math::cos(angle) * @speed,
							  Math::sin(angle) * @speed)
				.set_rotation(angle)
		end
		
		def update owner, bullets, dt
			if @current_wait < @wait
				@current_wait += dt
			else
				if @current_repeat < @repeat
					@current_interval += dt
					if @current_interval > @interval
						@current_interval = 0.0
						@count.times{ |i|
							fire(i, bullets, owner.position.x + @offset.x, owner.position.y + @offset.y)
						}
						@current_repeat += 1
						@angle += @angle_add
					end
				else
					reset()
				end
			end
		end		
	end
end