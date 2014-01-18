Foundation Rails Template
=========================

If you're like me, a Rubymine user, you might be kind of aggetated that you can't setup a "default" folder structure.
Let's say: "create "application.css.scss" once a new project is created", instead of going to the file, hitting Shift-F6 to rename the file appropriately before running your normal Foundation installation routine.

This template basically renames your application.css to application.css.scss during the creation of the project, once it has finished doing that it will run through your Gemfile and checking whether or not 'foundation-rails' exists.
If it does not, add it and then let Rails finish creating your project.

``` ruby
# Check if application.css.scss exists.
if File.exist?('app/assets/stylesheets/application.css.scss')
	puts '"application.css.scss" already exists'
else
# If it does not: add it.
	Dir.glob('app/assets/stylesheets/application.css').each do |f|
		FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.css.scss"
		puts "application.css renamed to application.css.scss"
	end
end
```

Sometimes though, you might not want to add Foundation or SASS for that matter to your project, the ultra supah awesome Y/N feature will let you run the installation normally, as if you didn't have the Template active at all.

``` ruby
puts 'Do you want to enable SASS? (Y/N)'
```

``` ruby
case input.upcase
  when "Y"
  	Add_Scss.implement_scss
  when "N"
  	puts "SASS was not added."
  else
  	puts "Please enter Y or N"
  	get_input
end
```

This only applies to Rubymine users though, where you have a Template file loaded during the creation screen (or similar IDE's). If you're not, you simply will not add the template to your Console command =)


####So, how do I run this thing?

#####Rubymine:
When you create a new project; choose a name, project directory and "Rails Application".
On the second prompt which appears - where you select your Rails version, Ruby SDK, etc - browse to the `template.rb` inside the `foundation-install-template` folder.


#####Not using Rubymine? Not a problem:
New Rails app using the Template:
``` ruby
$ rails new <project_name> -m /path/to/template.rb
```

Or add the Template to an existing Rails app:
``` ruby
$ rake rails:template LOCATION=/path/to/template.rb
```

####Download links:
7zip: https://dl.dropboxusercontent.com/u/55554784/Ruby/foundation-install.7z

zip: https://dl.dropboxusercontent.com/u/55554784/Ruby/foundation-install.zip




####View it on Foundation Forum
http://foundation.zurb.com/forum/posts/1627/

Leave feedback, get help and share your ideas.
