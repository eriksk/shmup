module Shmup
	class Game

		def initialize window
			@window = window

			@bullets = []
			@bullets.push Bullet.new Shmup.load_image(window, 'bullet_blue'), 5000
		end

		def update dt
			@bullets.each do |b|
				b.update dt
				if !b.alive?
					@bullets.delete b
				end
			end
		end
		
		def draw
			@bullets.each { |b|	b.draw }
		end
	end
end