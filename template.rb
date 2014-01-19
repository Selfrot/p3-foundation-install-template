require 'fileutils'
require File.join(File.dirname(__FILE__), '/template_classes.rb')

puts 'Do you want to enable SASS? (Y/N)'
Add_Scss::get_input

puts 'Do you want to add the Foundation gem? (Y/N)'
Add_Foundation::get_input

if File.exist?('app/assets/stylesheets/application.css.scss')
	insert_into_file 'app/assets/stylesheets/application.css.scss',
	                 "\n*/\n@import 'foundation_and_overrides';\n/*",
	                 :after =>  '*= require_self'

	puts 'Added foundation_and_overrides to your application.css.scss file.'
else
	puts 'Skipping Scss support for Foundation install.'
end
