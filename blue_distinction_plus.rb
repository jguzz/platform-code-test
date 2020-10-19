require_relative 'award'

class BlueDistinctionPlus < Award
	# Never decreases in value
	# Always 80pts
	def update_quality
		self.quality = 80
	end
end