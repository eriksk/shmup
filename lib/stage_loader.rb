module Shmup
	class StageLoader

		def self.load(window, name)
			json = nil
			File.open("#{CONTENT_ROOT}/stages/#{name}.json", "r") do |file|
				json = JSON.parse(file.read)
			end

			load_from_json(window, json)
		end

		def self.load_from_json(window, json)
			name = json['name']

			stage = Stage.new window, name
			json['enemies'].each do |e|
				count = 1
				if e['count']
					count = e['count']
				end
				if DEBUG
					if !e['start_offset'] && count > 1
						puts "WARNING: Multiple enemies on the same position"
					end
				end
				count.times do |i|
					start_offset = e['start_offset']
					enter_on = e['enter_on'] + (start_offset ? start_offset * i : 0.0)
					type = e['type']
					start = Vec2.new(e['path']['start']['x'], e['path']['start']['y'])
					stop = Vec2.new(e['path']['stop']['x'], e['path']['stop']['y'])
					out = Vec2.new(e['path']['out']['x'], e['path']['out']['y'])
					duration = e['path']['duration']
					stay = e['path']['stay']
					path = ShipPath.new(start, stop, out, duration * 1000.0, stay * 1000.0)
					emitters = []
					e['emitters'].each do |emitter|
						emitters << BulletEmitter.new(window, {
							:count => emitter['count'],
							:interval => emitter['interval'], 
							:angle => emitter['angle'],
							:angle_diff => emitter['angle_diff'],
							:wait => emitter['wait'],
							:repeat => emitter['repeat'],
							:speed => emitter['speed'],
							:angle_add => emitter['angle_add']
						})
					end
					enemy = Enemy.new(Shmup.load_image(window, 'enemy_mini'), emitters, path, enter_on)
					stage.enemies.push enemy
				end
			end

			stage
		end
	end
end