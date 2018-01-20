require 'rails/railtie'

module R404
    class Railtie < ::Rails::Railtie

        initializer 'r404.action_controller' do
            ActiveSupport.on_load :action_controller do
                include R404Helper
            end
        end

    end
end
