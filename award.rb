class Award 
	attr_reader :name
	attr_accessor :expires_in, :quality

	def initialize(name, expires_in, quality)
		@name = name
		@expires_in = expires_in
		@quality = quality
	end
	
	# Quality update for all non-specific awards
	# Decreses by 1 while quality > 0
	# Decreses by 2 when expired.
	def update_quality
		expire()
		self.quality > 0 ? self.quality -= 1 : nil
		if self.expires_in < 0
			self.quality > 0 ? self.quality -= 1 : nil
		end
	end
	def expire
		self.expires_in -= 1
	end
end


class BlueCompare < Award
	# Increases in quality the closer it is to expiring
	#Quality increases by 2 when there are 10 or < days left till it expires, and 3 when there are 5 days or <
	# Quality == 0 when experation hits.
	def update_quality
		if self.quality < 50
			self.quality += 1
			if self.expires_in < 11
				self.quality < 50 ? self.quality += 1 : nil
			end
			if self.expires_in < 6
				self.quality < 50 ? self.quality += 1 : nil
			end
		end
		expire()
		self.expires_in < 0 ? self.quality -= self.quality : nil
	end
end

class BlueFirst < Award	
	# Quality increases over time
	def update_quality
		expire()
		self.quality < 50 ? self.quality += 1 : nil
		if self.expires_in < 0
			self.quality < 50 ? self.quality += 1 : nil
		end
	end
end
class BlueDistinctionPlus < Award
	# Never decreases in value
	# Always 80pts
	def update_quality
		self.quality = 80
	end
end

class BlueStar < Award 
	# Quality decreses by x2 the amount of pts per day.
	# Quality decreses by x4 when expired.
	def update_quality 
		if self.quality > 0  
			self.quality -= 2  
			self.expires_in <= 0 ? self.quality -= 2 : nil
		end
		expire()
	end
end