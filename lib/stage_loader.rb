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
			puts json	

			name = json['name']
			
		end
	end
end