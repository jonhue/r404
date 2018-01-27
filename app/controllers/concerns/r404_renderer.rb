module R404Renderer

    extend ActiveSupport::Concern

    included do
        rescue_from (R404::AccessDenied) { |exception| render_r404 :access_denied, 403, exception }
        rescue_from (R404::NotFound) { |exception| render_r404 :not_found, 404, exception }

        def render_r404 code, status, exception
            logger.error exception
            respond_to do |format|
                begin
                    send "render_r404_#{code}", format, status, exception
                rescue NoMethodError
                    render_r404_for code, format, status, exception
                end
                format.all { render nothing: true, status: status }
            end
        end

        def render_r404_for code, format, status, exception = nil
            format.html { render "r404/#{code}", status: status, locals: { status: status, exception: exception } }
        end
    end

end
