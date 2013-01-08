module Shmup
	class Entity

		attr_accessor :image, :position, :velocity, :origin, :rotation, :scale

		def initialize image
			@image = image
			@position = Vec2.new
			@velocity = Vec2.new
			@origin = Vec2.new(0.5, 0.5)
			@rotation = 0.0
			@scale = 1.0
		end

		def update dt
			
		end

		def draw
			@image.draw_rot(@position.x, @position.y, 0, @rotation, @origin.x, @origin.y, @scale, @scale)
		end
	end
end