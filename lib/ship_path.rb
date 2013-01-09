module Shmup
	class ShipPath

		attr_accessor :position

		def initialize start, stop, out, duration, stay
			@start = start
			@stop = stop
			@out = out
			@duration = duration
			@stay = stay
			@stage = :transition_in
			@position = Vec2.new
			@current = 0.0
		end

		def total_life_time
			(@duration * 2.0) + @stay
		end

		def done?
			@stage == :done
		end

		def update dt
			@current += dt
			case @stage
				when :transition_in
					if @current > @duration
						@current = 0.0
						@stage = :staying
					end
				when :staying
					if @current > @stay
						@current = 0.0
						@stage = :transition_out
					end
				when :transition_out				
					if @current > @stay
						@stage = :done
					end
			end
		end		
	end
end