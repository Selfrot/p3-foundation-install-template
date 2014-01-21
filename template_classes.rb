module Actions
	class Add_Foundation
		@tmp_file = File.join(File.dirname(__FILE__), '/tmp.txt')

		# The method for adding the Foundation gem to our Gemfile.
		def self.implement_fndn


			# Define the gem to be added.
			fndn_gem = "\ngem 'foundation-rails'\n"

			# Define the name of our Gemfile and the method on which to open it. 'r' is 'Read'.
			gem_file = File.open('Gemfile', 'r')

			# Let's read the Gemfile and determine if the Foundation gem exists.
			read_gemfile = gem_file.read

			# Determine the current state of our Gemfile.
			if !!(read_gemfile =~ /gem 'foundation-rails'/) == false
				add_foundation = true
			else
				add_foundation = false
			end

			# Depending on the state of our Gemfile, we respond accordingly.
			if add_foundation

				# Open the Gemfile, this time using 'a' or 'Append' and print out that we've added the gem.
				File.open('Gemfile', 'a') {|append| append.write(fndn_gem)}
				puts "Successfully added Foundation to your Gemfile."
				File.open(@tmp_file, 'w+') {|tempentry| tempentry.write("ACTIVE")}

			elsif !add_foundation

				# Print out that the gem exists inside the Gemfile.
				puts "Foundation is already in your Gemfile."
				File.open(@tmp_file, 'w+') {|tempentry| tempentry.write("EXISTING")}

			end
		end	# End of implement_fndn




		# The method which receives the input from our console.
		def self.get_input
			STDOUT.flush
			# Get the input from the console and store it as a variable.
			input = STDIN.gets.chomp

			# Open up a case and print our variable in uppercase.
			case input.upcase

				# We've entered "Y" into the console.
				when "Y"
					# Call the method for adding our gem to the Gemfile.
					Add_Foundation.implement_fndn

				# We've entered "N" into the console.
				when "N"
					# So we inform ourselves that we did not add the gem.
					puts "Foundation was not added."

				# We haven't typed in "Y" or "N" in our console, or we've simply filled it with nonsense.
				else
					# Let's make sure that we print out what went wrong, so there will be no confusion...
					puts "Please enter Y or N"
					# ...then run it all over again.
					get_input
			end
		end # End of get_input
	end



	class Add_Scss

		# Method for adding the .scss extension to our application.css file.
		def self.implement_scss

			# First we determine whether "application.css.scss" exists.
			if File.exist?('app/assets/stylesheets/application.css.scss')

				# Print out this fine message if it does.
				puts '"application.css.scss" already exists'

				# If it does not:
			else
				# Open open up our Stylesheet directory.
				Dir.glob('app/assets/stylesheets/application.css').each do |f|
					# Then "move" the file. What we're actually doing is moving it to a different name. Weird huh?
					FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.css.scss"

					puts "application.css renamed to application.css.scss"
				end
			end


		end

		# Method for receiving our console input.
		def self.get_input
			STDOUT.flush

			# Bind our console input to a variable.
			input = STDIN.gets.chomp

			# Open up a case and transform our input to uppercase.
			case input.upcase

				# We've entered "Y" in our console...
				when "Y"
					# Call our "implement_scss" method.
					Add_Scss.implement_scss

				# We've entered "N" in our console...
				when "N"

					# ...so we simply print out that nothing was added.
					puts "SASS was not added."

				# We've typed in something we don't want, or simply forgot to type something in and just hit "enter".
				else
					# Print out what went wrong, how to fix it and...
					puts "Please enter Y or N"

					# ...start all over again.
					get_input
			end
		end
	end
end
