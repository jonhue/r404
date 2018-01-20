require 'rails/generators'
require 'rails/generators/migration'

class R404Generator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install r404'

    def create_views
        template 'access_denied.html.erb', 'app/views/r404/access_denied.html.erb'
        template 'not_found.html.erb', 'app/views/r404/not_found.html.erb'
    end

end
