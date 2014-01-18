require 'fileutils'
require File.join(File.dirname(__FILE__), '/template_classes.rb')

puts 'Do you want to enable SASS? (Y/N)'
Add_Scss::get_input

puts 'Do you want to add the Foundation gem? (Y/N)'
Add_Foundation::get_input
