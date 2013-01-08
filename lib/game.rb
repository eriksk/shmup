module Shmup
	class Game

		def initialize window
			@window = window

			@bullets = []
			@bullets.push Bullet.new(Shmup.load_image(window, 'bullet_yellow'), 5000)
				.set_position(100, 100)
				.set_velocity(-0.5 + rand(), -0.5 + rand())
			@player = Ship.new(Shmup.load_image(window, 'ship_player'), PlayerController.new(window), 0.2)
				.set_position(WIDTH / 2.0, HEIGHT - 128)
		end

		def update dt
			@bullets.each do |b|
				b.update dt
				if !b.alive?
					@bullets.delete b
				end
			end
			@player.update dt
		end
		
		def draw
			@bullets.each { |b|	b.draw }
			@player.draw
		end
	end
end