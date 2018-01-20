module R404Controller

    extend ActiveSupport::Concern

    included do
        rescue_from (R404::AccessDenied) { |exception| render_r404 :access_denied, exception }
        rescue_from (CanCan::AccessDenied) { |exception| render_r404 :access_denied, exception }
        rescue_from (R404::NotFound) { |exception| render_r404 :not_found, exception }
        rescue_from (ActiveRecord::RecordNotFound) { |exception| render_r404 :not_found, exception }
        rescue_from (AbstractController::ActionNotFound) { |exception| render_r404 :not_found, exception }
        rescue_from (ActionController::RoutingError) { |exception| render_r404 :not_found, exception }

        def render_r404 code, exception
            logger.error exception
            respond_to do |format|
                begin
                    send "render_r404_#{code}", format, exception
                rescue NoMethodError
                    render_r404_for code, format, exception
                end
            end
        end

        def render_r404_for code, format, exception = nil
            format.html { render "r404/#{code}", status: status, locals: { exception: exception } }
        end
    end

end
