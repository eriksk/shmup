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
				enter_on = e['enter_on']
				type = e['type']
				start = Vec2.new(e['path']['start']['x'], e['path']['start']['y'])
				stop = Vec2.new(e['path']['stop']['x'], e['path']['stop']['y'])
				out = Vec2.new(e['path']['out']['x'], e['path']['out']['y'])
				duration = e['path']['duration']
				stay = e['path']['stay']
				path = ShipPath.new(start, stop, out, duration * 1000.0, stay * 1000.0)
				emitters = [] # TODO: load emitters
				enemy = Enemy.new(Shmup.load_image(window, 'enemy_mini'), emitters, path, enter_on)
				stage.enemies.push enemy
			end

			stage
		end
	end
end