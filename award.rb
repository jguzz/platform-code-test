class Award 
	attr_reader :name
	attr_accessor :expires_in, :quality

	def initialize(name, expires_in, quality)
		@name = name
		@expires_in = expires_in
		@quality = quality
	end

	def update_quality
		# Specific awards update differently...
		case self.name
			
		# Specific awards
		when 'Blue First'
			self.blue_first_quality
			
		when 'Blue Compare'
			self.blue_compare_quality

		when 'Blue Distinction Plus'
			self.blue_distinction_plus_quality
			
		when 'Blue Star'
			self.blue_star_quality
			
		# Other awards...
		else 
			self.regular_quality
		end
	end
	
	
	# Quality update for all non-specific awards
	# Decreses by 1 while quality > 0
	# Decreses by 2 when expired.
	def regular_quality
		self.expires_in -= 1
		self.quality > 0 ? self.quality -= 1 : nil
		if self.expires_in < 0
			self.quality > 0 ? self.quality -= 1 : nil
		end
	end
	
	# Increases in quality the closer it is to expiring
	#Quality increases by 2 when there are 10 or < days left till it expires, and 3 when there are 5 days or <
	# Quality == 0 when experation hits.
	def blue_compare_quality
		if self.quality < 50
			self.quality += 1
			if self.expires_in < 11
				self.quality < 50 ? self.quality += 1 : nil
			end
			if self.expires_in < 6
				self.quality < 50 ? self.quality += 1 : nil
			end
		end
		self.expires_in -= 1
		self.expires_in < 0 ? self.quality -= self.quality : nil
	end
	
	# Quality increases over time
	def blue_first_quality
		self.expires_in -= 1
		self.quality < 50 ? self.quality += 1 : nil
		if self.expires_in < 0
			self.quality < 50 ? self.quality += 1 : nil
		end
	end
	
	# Never decreases in value
	# Always 80pts
	def blue_distinction_plus_quality
		self.quality = 80
	end

	# Quality decreses by x2 the amount of pts per day.
	# Quality decreses by x4 when expired.
	def blue_star_quality
		if self.quality > 0  
			self.quality -= 2  
			self.expires_in <= 0 ? self.quality -= 2 : nil
		end
		self.expires_in -= 1
	end 
end