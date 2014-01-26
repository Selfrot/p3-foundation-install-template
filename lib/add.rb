class Add
	# Should we add SCSS to our Rails application?
	def self.scss?
		scss = File.exist?('app/assets/stylesheets/application.css.scss')
		# Open a new case, this time with a boolean outcome in mind.
		case scss
			# If scss returns 'true', i.e. if the file already exists.
			when true
				# Print out that the file already exists.
				puts '"application.css.scss" already exists'
			# If it returns true and the file does not exist...
			when false
				puts "\n\n=======================================\nDo you want to enable SASS?\n=================(Y/N)================="
				# Flush buffered data.
				STDOUT.flush
				# Bind console input to a variable named input
				input = STDIN.gets.chomp
				# Open a case and transform our input to uppercase.
				case input.upcase
					# When we've entered 'N'...
					when 'N'
						# Print out that SASS was not added.
						puts 'SASS was not added.'
					# When we've entered 'Y'...
					when 'Y'
						old = 'app/assets/stylesheets/application.css'
						new = 'app/assets/stylesheets/application.css.scss'
						File.rename(old, new)
					# If we've entered bogus letters and numbers, or absolutely nothing...
					else
						# Make sure that we let ourselves know that we only accept yes and no answers...
						puts 'Please enter Y or N'
						# ...and then start all over again.
						Add.scss?
				end
			# If for some reason the case returns neither true nor false - return.
			else
				return
		end
	end # end of 'scss?' method
	def self.foundation?
		# Bind variable 'gem_file' to open our Gemfile for reading only.
		gem_file = File.open('Gemfile', 'r')
		# Match our 'line' variable with the contents of our Gemfile. '!!()' will make our match boolean instead of '1' and 'nil'
		match = !!(gem_file.read =~ /gem 'foundation-rails'/)
		gem_file.close
		# Open up a case for our match variable.
		case match
			# When the match returns true, i.e. the gem Does exist in our Gemfile...
			when true
				# ...write to the console that the gem exists.
				puts "Foundation is already in your Gemfile."
			# When the match returns false, i.e. the gem does Not exist in our Gemfile...
			when false
				puts "\n\n=======================================\nDo you want to add the Foundation gem?\n=================(Y/N)=================\n"
				# Flush the buffer.
				STDOUT.flush
				# Bind console input to a variable named input
				input = STDIN.gets.chomp
				# 'Y' answer.
				case input.upcase
					# When we've entered 'N'...
					when 'N'
						# Print out that Foundation was not added.
						puts 'Foundation was not added.'
					# When we've entered 'Y'...
					when 'Y'
						# Bind our gem to the variable 'line'. Pre- and suffix the gem with \n which adds a linebreak before and after the inserted line.
						gem = "\ngem 'foundation-rails'\n"
						# ...open up the gem file, this time using 'a' or 'append' and append our gem at the bottom of the file.
						File.open('Gemfile', 'a') {|append| append.write(gem)}
						# Print out that the gem file was added.
						puts 'Successfully added Foundation to your Gemfile.'
						# If we've entered bogus letters and numbers, or absolutely nothing...
					else
						# Make sure that we let ourselves know that we only accept yes and no answers...
						puts "Please enter Y or N"
						# ...and then start all over again.
						Add.foundation?
				end
			# If for some reason the case returns neither true nor false - return.
			else
				return
		end
	end # end of 'foundation?' method
end # end of 'Add' class
