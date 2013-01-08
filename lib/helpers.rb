module Shmup
	def self.load_image(window, name)
		Gosu::Image.new(window, "#{CONTENT_ROOT}/gfx/#{name}.png")
	end
end

class Numeric
	def to_radians
		self * 180.0 / Math::PI
	end
end