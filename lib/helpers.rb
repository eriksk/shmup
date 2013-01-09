module Shmup
	def self.load_image(window, name)
		Gosu::Image.new(window, "#{CONTENT_ROOT}/gfx/#{name}.png")
	end

	def self.load_sample(window, name)
		Sample.new(window, "#{CONTENT_ROOT}/audio/#{name}.wav")
	end

	def self.load_song(window, name)
		
	end

	def self.to_degrees radiens
		radiens * 180 / Math::PI
	end

	def self.to_radians radiens
		radiens * 180 / Math::PI
	end

	def self.wrap_angle(angle)
		while angle > Airstrike::to_radians(360.0)
			angle -= Airstrike::to_radians(360.0)
		end
		while angle < 0.0
			angle += Airstrike::to_radians(360.0)
		end
		angle
	end

	# linear interpolation
	def self.lerp x, y, w
		x + (y - x) * w		
	end

	# cubic interpolation using a hermite spline, aka smooth step
	def self.qlerp(min, max, weight)
		hermite(min, 0.0, max, 0.0, weight)
	end

	# value1, tangent1, value2, tangent2
	def self.hermite(v1, t1, v2, t2, weight)
		sCubed = weight * weight * weight
		sSquared = weight * weight
		result = 0.0
		if weight == 0.0
			result = v1
		elsif weight == 1.0
			result = v2
		else
			result = (2 * v1 - 2 * v2 + t2 + t1) * sCubed + (3 * v2 - 3 * v1 - 2 * t1 - t2) * sSquared + t1 * weight + v1
		end
	    result
	end
end

class Numeric
	def to_radians
		self * 180.0 / Math::PI
	end
end