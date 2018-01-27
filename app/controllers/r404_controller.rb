class R404Controller < ApplicationController

    def access_denied
        r404 :access_denied
    end

    def not_found
        r404 :not_found
    end

end
