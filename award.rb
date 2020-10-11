# Award object 
class Award 
	attr_reader :name
	attr_accessor :expires_in, :quality

	def initialize(name, expires_in, quality)
		@name = name
		@expires_in = expires_in
		@quality = quality
	end

	def update_quality
		case self.name
			
		# Special awards
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
	
	
	# Affects all non-specific awards
	def regular_quality
		self.expires_in -= 1
		if self.quality > 0 
			self.quality -= 1 
		end

		if self.expires_in < 0
			if self.quality > 0
				self.quality -= 1
			end
		end
	end
	
	#Helper method for all special excluding 'Blue Distinction Plus'
	def special_quality
		self.expires_in -= 1
		
		if self.quality < 50  
			self.quality += 1 			
		end
	end
	
	# increases in quality the closer it is to expiring
	#Quality increases by 2 when there are 10 or < days left till it expires, and 3 when there are 5 days or <
	# Quality == 0 when experation hits.
	def blue_compare_quality
		if self.quality < 50
			self.quality += 1
			if self.expires_in < 11
				if self.quality < 50
					self.quality += 1
				end
			end
			if self.expires_in < 6
				if self.quality < 50
					self.quality += 1
				end
			end
		end
		self.expires_in -= 1
		if self.expires_in < 0
			self.quality = self.quality - self.quality
		end
	end
	
	# Quality increases over time
	def blue_first_quality
		self.special_quality
		if self.expires_in < 0
			if self.quality < 50
				self.quality += 1
			end
		end
	end
	
	# Never decreases in value
	# Always 80pts
	def blue_distinction_plus_quality
		self.quality = 80
		# self.expires_in < 0 ? self.quality = self.quality - self.quality : nil 
	end

	#  Quality decreses by x2 the amount of pts per day.
	def blue_star_quality
		if self.quality > 0  
			self.quality -= 2  
			self.expires_in <= 0 ? self.quality -= 2 : nil
		end
		self.expires_in -= 1
	end 
end