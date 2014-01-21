require 'fileutils'
require File.join(File.dirname(__FILE__), '/template_classes.rb')
tmp_file = File.join(File.dirname(__FILE__), '/tmp.txt')

unless File.exist?(tmp_file)
	File.open(tmp_file, 'w+') { |tempentry| tempentry.write("MAKE") }
end

puts 'Do you want to enable SASS? (Y/N)'
::Actions::Add_Scss.get_input

puts 'Do you want to add the Foundation gem? (Y/N)'
::Actions::Add_Foundation.get_input

tmp_read = File.open(tmp_file, 'r')
read_temp_file = tmp_read.read

if !!(read_temp_file =~ /ACTIVE/)
	@fndn = true
else
	@fndn = false
end

if File.exist?('app/assets/stylesheets/application.css.scss') && @fndn
	insert_into_file 'app/assets/stylesheets/application.css.scss',
	                 "\n*/\n@import 'foundation_and_overrides';\n/*",
	                 :after =>  '*= require_self'

	puts 'Added foundation_and_overrides to your application.css.scss file.'
else
	puts 'Skipping Scss support for Foundation install.'
end
