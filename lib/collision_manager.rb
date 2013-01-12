module Shmup
	class CollisionManager

		def initialize stage
			@stage = stage
		end
		
		def update dt, player, enemies, player_bullets, enemy_bullets
			player_bullets.each do |b|
				enemies.each do |e|
					if collides? b, e
						player_bullets.delete b
						e.damage 1
						if e.dead?
							enemies.delete e
						end
					end
				end
			end
		end		

		def collides? entity1, entity2
			if entity1.position.x + entity1.image.width / 2.0 < entity2.position.x - entity2.image.width / 2.0
				return false
			end
			if entity1.position.x - entity1.image.width / 2.0 > entity2.position.x + entity2.image.width / 2.0
				return false
			end
			if entity1.position.y + entity1.image.height / 2.0 < entity2.position.y - entity2.image.height / 2.0
				return false
			end
			if entity1.position.y - entity1.image.height / 2.0 > entity2.position.y + entity2.image.height / 2.0
				return false
			end
			true
		end
	end
end