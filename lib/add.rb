require 'fileutils'

class Add
	def self.scss?
		scss = File.exist?('app/assets/stylesheets/application.css.scss')
		case scss
			when true
				puts '"application.css.scss" already exists'
			when false
				puts "\n\n=======================================\nDo you want to enable SASS?\n=================(Y/N)================="
				STDOUT.flush
				input = STDIN.gets.chomp
				case input.upcase
					when 'N'
						puts 'SASS was not added.'
					when 'Y'
						old = 'app/assets/stylesheets/application.css'
						new = 'app/assets/stylesheets/application.css.scss'
						File.rename(old, new)
					else
						puts 'Please enter Y or N'
						Add.scss?
				end
			else
				return
		end
	end
	def self.foundation?
		gem_file = File.open('Gemfile', 'r')
		match = !!(gem_file.read =~ /gem 'foundation-rails'/)
		gem_file.close
		case match
			when true
				puts "Foundation is already in your Gemfile."
			when false
				puts "\n\n=======================================\nDo you want to add the Foundation gem?\n=================(Y/N)=================\n"
				STDOUT.flush
				input = STDIN.gets.chomp
				case input.upcase
					when 'N'
						puts 'Foundation was not added.'
					when 'Y'
						gem = "\ngem 'foundation-rails'\n"
						File.open('Gemfile', 'a') {|append| append.write(gem)}
						puts 'Successfully added Foundation to your Gemfile.'
						if File.exist?('app/assets/stylesheets/application.css.scss')
							unless File.read('app/assets/stylesheets/application.css.scss') =~ /@import 'foundation_and_overrides';/
								match = "*= require_self"
								text = File.read('app/assets/stylesheets/application.css.scss')
								replace = text.gsub("#{match}", "*= require_self\n*/\n@import 'foundation_and_overrides';\n/*")
								File.open('app/assets/stylesheets/application.css.scss', "w") { |file| file << replace }
							end
						end
					else
						puts "Please enter Y or N"
						Add.foundation?
				end
			else
				return
		end
	end
end
