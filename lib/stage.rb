module Shmup
	class Stage

		attr_accessor :enemies

		def initialize window, name
			@window = window
			@time = 0.0

			@player = Ship.new(Shmup.load_image(window, 'ship_player'), PlayerController.new(window), 0.01, [
					BulletEmitter.new(window, {
						:count => 2,
						:interval => 50, 
						:angle => -90,
						:wait => 100,
						:repeat => 3,
						:speed => 1.0,
						:texture => "bullet_player_1",
						:offset => Vec2.new(0, -32)
					}),
					BulletEmitter.new(window, {
						:count => 2,
						:interval => 50, 
						:angle => -90,
						:wait => 100,
						:repeat => 3,
						:speed => 1.0,
						:texture => "bullet_player_1",
						:offset => Vec2.new(-16, -16)
					}),
					BulletEmitter.new(window, {
						:count => 2,
						:interval => 50, 
						:angle => -90,
						:wait => 100,
						:repeat => 3,
						:speed => 1.0,
						:texture => "bullet_player_1",
						:offset => Vec2.new(16, -16)
					})
				])
				.set_position(WIDTH / 2.0, HEIGHT - 128)

			@player_bullets = []
			@enemy_bullets = []
			@enemies = []
		end

		def fast_forward_to time_in_milliseconds
			# TODO: fast forward
		end

		def pause
		end

		def resume
		end

		def update_bullets dt
			@player_bullets.each do |b|
				b.update dt
				if !b.alive?
					@player_bullets.delete b
				end
			end
			@enemy_bullets.each do |b|
				b.update dt
				if !b.alive?
					@enemy_bullets.delete b
				end
			end			
		end
		
		def update dt
			@time += dt
			
			update_bullets dt

			@player.update dt
			if @window.button_down?(Gosu::KbSpace)
				@player.emitters.each do |emitter|
					emitter.update @player, @player_bullets, dt
				end
			else
				@player.emitters.each do |emitter|
					emitter.reset 
				end
			end
			@enemies.each do |e|
				e.update dt, @time
				if e.started? @time
					e.emitters.each do |emitter|
						emitter.update e, @enemy_bullets, dt
					end
					if !e.alive?
						@enemies.delete e
					end
				end
			end
		end

		def draw
			@enemies.each do |e|
				e.draw				
			end
			@player_bullets.each { |b|	b.draw }
			@player.draw

			@enemy_bullets.each { |b|	b.draw }
		end
	end
end