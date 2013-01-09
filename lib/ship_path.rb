module Shmup
	class ShipPath

		attr_accessor :position

		def initialize start, stop, out, duration, stay
			@start = start
			@stop = stop
			@out = out
			@duration = duration
			@stay = stay
			@state = :transition_in
			@position = Vec2.new(@start.x, @start.y)
			@current = 0.0
		end

		def total_life_time
			(@duration * 2.0) + @stay
		end

		def done?
			@state == :done
		end

		def update dt
			@current += dt
			case @state
				when :transition_in
					@position.x = Shmup.qlerp(@start.x, @stop.x, @current / @duration)
					@position.y = Shmup.qlerp(@start.y, @stop.y, @current / @duration)
					if @current > @duration
						@current = 0.0
						@state = :staying
					end
				when :staying
					if @current > @stay
						@current = 0.0
						@state = :transition_out
					end
				when :transition_out				
					@position.x = Shmup.qlerp(@stop.x, @out.x, @current / @duration)
					@position.y = Shmup.qlerp(@stop.y, @out.y, @current / @duration)
					if @current > @duration
						@state = :done
					end
				when :done
					# do nothing
			end
		end		
	end
end