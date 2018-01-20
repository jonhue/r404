module R404Helper

    def r404 code = 404, exception = nil
        # status = code.is_a?(Integer) ? code : nil
        case code
        when 403, :access_denied
            raise R404::AccessDenied.new(exception)
        when 404, :not_found
            raise R404::NotFound.new(exception)
        end
    end

end
