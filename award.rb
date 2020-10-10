# Award = Struct.new(:name, :expires_in, :quality)

class Award 
	attr_accessor :name, :expires_in, :quality

	def initialize(name, expires_in, quality)
		@name = name
		@expires_in = expires_in
		@quality = quality
	end

	#Copied from original update_quality.rb
		# award changed to self
	def update_quality 
		if self.name != 'Blue First' && self.name != 'Blue Compare'
			if self.quality > 0
			if self.name != 'Blue Distinction Plus'
				self.quality -= 1
			end
			end
		else
			if self.quality < 50
			self.quality += 1
			if self.name == 'Blue Compare'
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
			end
		end
		if self.name != 'Blue Distinction Plus'
			self.expires_in -= 1
		end
		if self.expires_in < 0
			if self.name != 'Blue First'
			if self.name != 'Blue Compare'
				if self.quality > 0
				if self.name != 'Blue Distinction Plus'
					self.quality -= 1
				end
				end
			else
				self.quality = self.quality - self.quality
			end
			else
			if self.quality < 50
				self.quality += 1
			end
			end
		end
	end
end

