class Add

	# Should we add SCSS to our Rails application?
	def self.scss?
		# Flush buffered data.
		STDOUT.flush
		# Bind console input to a variable named input
		input = STDIN.gets.chomp
		# Open a case and transform our input to uppercase.
		case input.upcase


			# When we've entered 'N'...
			when "N"
				# Print out that SASS was not added.
				puts "SASS was not added."


			# When we've entered 'Y'...
			when "Y"
				# ...start with checking if the file already exists.
				scss = File.exist?('app/assets/stylesheets/application.css.scss')

				# Open a new case, this time with a boolean outcome in mind.
				case scss
					# If scss returns 'true', i.e. if the file already exists.
					when true
						# Print out that the file already exists.
						puts '"application.css.scss" already exists'
						# If it returns true and the file does not exist...
					when false
						# ...find every occurance of the file in the stylesheet's folder.
						Dir.glob('app/assets/stylesheets/application.css').each do |f|
							# "Move" the file to a new name, using the basename as a guide. To preserve the folder it's in, and 'application.css' + '.scss'
							# Without both string interpolations, we would end up with an 'application.scss' in our 'assets' folder, instead.
							FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.css.scss"
							# Print out what we did and we're all done!
							puts "application.css renamed to application.css.scss"
						end
					# If for some reason the case returns neither true nor false - return.
					else
						return
				end

				# If we've entered bogus letters and numbers, or absolutely nothing...
			else
				# Make sure that we let ourselves know that we only accept yes and no answers...
				puts "Please enter Y or N"
				# ...and then start all over again.
				scss?
		end
	end # end of 'scss?' method



	def self.foundation?

		# Flush the buffer.
		STDOUT.flush
		# Bind console input to a variable named input
		input = STDIN.gets.chomp
		# 'Y' answer.
		case input.upcase


			# When we've entered 'N'...
			when "N"
				# Print out that Foundation was not added.
				puts "Foundation was not added."


			# When we've entered 'Y'...
			when "Y"
				# Bind our gem to the variable 'line'
				line = "\ngem 'foundation-rails'\n"
				# Bind variable 'gem_file' to open our Gemfile for reading only.
				gem_file = File.open('Gemfile', 'r')
				# Match our 'line' variable with the contents of our Gemfile.
				# '!!()' will make our match boolean instead of '1' and 'nil'
				match = !!(gem_file.read =~ /#{line}/)

				# Open up a case for our match variable.
				case match
					# When the match returns false, i.e. the gem does Not exist in our Gemfile...
					when false
						# ...open up the gem file, this time using 'a' or 'append' and append our gem at the bottom of the file.
						File.open('Gemfile', 'a') {|append| append.write(line)}
						# Print out that the gem file was added.
						puts "Successfully added Foundation to your Gemfile."

						# Check whether we're using SASS.
						if File.exist?('app/assets/stylesheets/application.css.scss')
							# If we do, bind reading our stylesheet to the variable 'scss_file'.
							scss_file = File.read('app/assets/stylesheets/application.css.scss')
							# Check to see whether our stylesheet already has the 'foundation_and_overrides' included.
							# If it's Not, write to the temp file that we should add it. Otherwise write that we shouldn't.
							(!!(scss_file =~ /@import 'foundation_and_overrides';/) == false) ?
									Utilities::Writes.tmp_entry("ADD SCSS LINE") :
									Utilities::Writes.tmp_entry("LINE EXISTS")
						end
					# When the match returns true, i.e. the gem Does exist in our Gemfile...
					when true
						# ...write to the console that the gem exists.
						puts "Foundation is already in your Gemfile."
						# Then write to the temp file that foundation already exists.
						Utilities::Writes.tmp_entry('FOUNDATION EXISTS')

					# If for some reason the case returns neither true nor false - return.
					else
						return
				end

			# If we've entered bogus letters and numbers, or absolutely nothing...
			else
				# Make sure that we let ourselves know that we only accept yes and no answers...
				puts "Please enter Y or N"
				# ...and then start all over again.
				foundation?
		end
	end # end of 'foundation?' method



end # end of 'Add' class
