require 'fileutils'
require File.join(File.dirname(__FILE__), '/template_classes.rb')
require File.join(File.dirname(__FILE__), '/util_classes.rb')

puts "\n\n=======================================\nDo you want to enable SASS?\n=================(Y/N)================="
Add.scss?

puts "\n\n=======================================\nDo you want to add the Foundation gem?\n=================(Y/N)=================\n"
Add.foundation?

# ========================================================================
# The code below is kept here because insert_into_file is a kernel method.

# Bind reading to our temp file with the parameter: "ADD SCSS LINE" -- to a variable.
add_scss_line = Utilities::Reads.read_tmp("ADD SCSS LINE")
# Check whether our scss stylesheet actually exists - should anything change during the time between writing to the tmp file until now.
# Also check our add_scss_line - without it, we would append the line even if we don't reply 'Y' to 'Add.foundation?'.
if File.exist?('app/assets/stylesheets/application.css.scss') && add_scss_line == true
	# Insert our @import after '*= require_self' but before '*= require_tree .', this is key, since files loaded before the overrides will... Override the overrides.
	insert_into_file 'app/assets/stylesheets/application.css.scss',
	                 "\n*/\n@import 'foundation_and_overrides';\n/*",
	                 :after =>  '*= require_self'
	# Print out what we did and be done with it!
	puts 'Added foundation_and_overrides to your application.css.scss file.'

	# If the stylesheet is not of .scss material, or if we're told not to add the scss line...
else
	# ...then print out that we're skipping scss support for this install.
	puts "Skipping Scss support for Foundation install."
end

# All done! Clear the temp file!
Utilities::Writes.tmp_entry('')
