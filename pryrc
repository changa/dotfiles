# vim: se ft=ruby :

# https://github.com/carlhuda/bundler/issues/183#issuecomment-1149953
if defined?(::Bundler) || File.exists?('Gemfile')
  global_gemset = ENV['GEM_PATH'].split(':').grep(%r{ruby.*@global|gemsets/global}).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

warn "loading global pryrc"

# see http://lucapette.com/pry/pry-everywhere/

# vim FTW
Pry.config.editor = "gvim --nofork"

# My pry is polite
Pry.config.hooks.add_hook(:after_session, :say_goodbye) do
  puts "bye-bye"
end

# Prompt with ruby version
Pry.prompt = [
  proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " },
  proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }
]


Pry.config.ls.public_method_color  = :bright_green
Pry.config.ls.private_method_color = :bright_black

%w[awesome_print pry-doc pry-nav].each  do |gem|
  begin
    require gem
    if gem == "pry-nav"
      Pry.commands.alias_command 'c', 'continue'
      Pry.commands.alias_command 's', 'step'
      Pry.commands.alias_command 'n', 'next'
    end
  rescue LoadError
    warn "could not load #{gem}"
   end
end

# LOOKSEE
begin
  warn "loading looksee"
  require "looksee"

  module PryLookseeCompatibility
    def ls *args
      if Pry.color
        Pry.color = false
        p super
        Pry.color = true
      nil
      else
        super
      end
    end
  end

  Object.send(:include, PryLookseeCompatibility)
rescue LoadError
    warn "could not load looksee!"
end

# loading rails configuration if it is running as a rails console
if defined?(Rails) && Rails.env && File.exists?(File.dirname(__FILE__) + '/.railsrc')
  warn "loading #{File.dirname(__FILE__) + '/.railsrc'}"
  load File.dirname(__FILE__) + '/.railsrc'
end

if File.exists?(File.expand_path('.pryrc')) && File.expand_path('.pryrc') != __FILE__
  warn "loading #{File.expand_path('.pryrc')}"
  load File.expand_path('.pryrc')
end
