require_relative 'award'

# Updates quality for each award... update is contextual to the type of award given.
def update_quality(awards)
  awards.each do |award|
    award.update_quality
  end
end
