require 'fileutils'
require File.join(File.dirname(__FILE__), '/template_classes.rb')
require File.join(File.dirname(__FILE__), '/util_classes.rb')

# Create an instance of the Utility class.
Utilities.new

puts "\n\n=======================================\nDo you want to enable SASS?\n=================(Y/N)================="
::Actions::Add_Scss.get_input

puts "\n\n=======================================\nDo you want to add the Foundation gem?\n=================(Y/N)=================\n"
::Actions::Add_Foundation.get_input



add_scss_line = Utilities::Reads.read_tmp("ADD SCSS LINE")

if File.exist?('app/assets/stylesheets/application.css.scss') && add_scss_line == true
	insert_into_file 'app/assets/stylesheets/application.css.scss',
	                 "\n*/\n@import 'foundation_and_overrides';\n/*",
	                 :after =>  '*= require_self'
	puts 'Added foundation_and_overrides to your application.css.scss file.'
else
	puts "Skipping Scss support for Foundation install."
end

# All done! Overwrite the temp file.
Utilities::Writes.tmp_entry('')
