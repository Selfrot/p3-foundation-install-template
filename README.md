Foundation Rails Template
=========================

This template will walk hand in hand with the Rails installation and add Scss and Foundation to your project, without You having to rename your application.css file or even add foundation to your Gemfile!

The source is documented so you can easily change things to suit your needs.

#####What it does:

The script will first notice:
``` ruby
# puts "Do you want to enable sass"...
Add.scss?
```
Which will prompt for a yes/no reply.
``` ruby
	scss = File.exist?('app/assets/stylesheets/application.css.scss')
	case scss
		when true
				puts '"application.css.scss" already exists'
		when false
			Dir.glob('app/assets/stylesheets/application.css').each do |f|
				FileUtils.mv f, "#{File.dirname(f)}/#{File.basename(f,'.*')}.css.scss"
				puts "application.css renamed to application.css.scss"
			end
		else
		  return
	end
```

Once SASS is out of the way, we'll run:
``` ruby
# puts "Do you want to enable foundation"...
Add.foundation?
```

To be sure that we don't add stuff that's already there.
Let's say you enter Y by mistake, then we have this nifty test to see whether our gem already exists.
``` ruby
line = "\ngem 'foundation-rails'\n"
gem_file = File.open('Gemfile', 'r')
match = !!(gem_file.read =~ /#{line}/)
case match
	when false
		File.open('Gemfile', 'a') {|append| append.write(line)}
		puts "Successfully added Foundation to your Gemfile."
		if File.exist?('app/assets/stylesheets/application.css.scss')
			scss_file = File.read('app/assets/stylesheets/application.css.scss')
			(!!(scss_file =~ /@import 'foundation_and_overrides';/) == false) ?
					Utilities::Writes.tmp_entry("ADD SCSS LINE") :
					Utilities::Writes.tmp_entry("LINE EXISTS")
		end
	when true
		puts "Foundation is already in your Gemfile."
		Utilities::Writes.tmp_entry('FOUNDATION EXISTS')
	else
		return
```

I figured a system which prompts for yes/no answers would be helpful for Rubymine users -- so we don't have to think about removing the Template whenever we want to create a project without Sass, Foundation or even both.
Also, we can now create a project which only uses only one of the two, by simply typing N - Y or Y - N respectively.


####So, how do I run this thing?
#####Rubymine:
When you create a new project; choose a name, project directory and "Rails Application".
On the second prompt which appears - where you select your Rails version, Ruby SDK, etc - browse to the `template.rb` inside the `foundation-install-template` folder using the "Rails Template:" box - or simply type in the absolute path.


#####Not using Rubymine? Not a problem:
New Rails app using the Template:
``` ruby
$ rails new <project_name> -m /path/to/template.rb
```

Or add the Template to an existing Rails app:
``` ruby
$ rake rails:template LOCATION=/path/to/template.rb
```



####View it on Foundation Forum
http://foundation.zurb.com/forum/posts/1627/

Leave feedback, get help and share your ideas.
