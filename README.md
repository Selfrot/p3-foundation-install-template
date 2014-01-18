Foundation Rails Template
=========================

####Download links:
7zip: https://dl.dropboxusercontent.com/u/55554784/Ruby/foundation-install.7z

zip: https://dl.dropboxusercontent.com/u/55554784/Ruby/foundation-install.zip

This template will walk hand in hand with the Rails installation and add Scss and Foundation to your project, without You having to rename your application.css file or even add foundation to your Gemfile!

The source is documented so you can easily change things to suit your needs.

#####What it does:

The script will first notice:
``` ruby
puts 'Do you want to enable SASS? (Y/N)'
Add_Scss::get_input
```
Which will prompt for a yes/no reply, depending on the input given - it will either rename `application.css` to have the extension `.css.scss`... Or not.

Should the Stylesheet already have the extension, we'll simply return that the file already exists.
``` ruby
# Check if application.css.scss exists.
if File.exist?('app/assets/stylesheets/application.css.scss')
	puts '"application.css.scss" already exists'
else
# Something else
end
```

Once SASS is out of the way, we'll run:
``` ruby
puts 'Do you want to add the Foundation gem? (Y/N)'
Add_Foundation::get_input
```
Which will check whether our gem exists in our Gemfile and add it if it doesn't:
``` ruby
if !!(read_gemfile =~ /gem 'foundation-rails'/) == false
	add_foundation = true
else
```

I figured this system would be helpful for Rubymine users, so we don't have to think about removing the Template when we create a project without Sass or Foundation.
Also, we can now create a project which only uses Sass or only uses Foundation, by simply typing N then Y or Y then N respectively.


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
