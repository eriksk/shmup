module Shmup
	class Stage

		def initialize window, name
			@window = window

			@bullets = []
			@bullets.push Bullet.new(Shmup.load_image(window, 'bullet_yellow'), 5000)
				.set_position(100, 100)
				.set_velocity(-0.5 + rand(), -0.5 + rand())
			@player = Ship.new(Shmup.load_image(window, 'ship_player'), PlayerController.new(window), 0.01, [
					BulletEmitter.new(window, {
						:count => 5,
						:interval => 200, 
						:angle => 0.0,
						:angle_diff => 0.2,
						:wait => 1000,
						:repeat => 6,
						:speed => 0.5,
						:angle_add => 45
					})
				])
				.set_position(WIDTH / 2.0, HEIGHT - 128)

			@enemies = []
			@time = 0.0
		end

		def fast_forward_to time_in_milliseconds
			# TODO: fast forward
		end

		def pause
		end

		def resume
		end
		
		def update dt
			@time += dt
			@bullets.each do |b|
				b.update dt
				if !b.alive?
					@bullets.delete b
				end
			end
			@player.update dt
			@player.emitters.each do |emitter|
				emitter.update @player, @bullets, dt
			end
			@enemies.each do |e|
				e.update dt, time
			end
		end

		def draw
			@bullets.each { |b|	b.draw }
			@enemies.each do |e|
				e.draw				
			end
			@player.draw
		end
	end
end