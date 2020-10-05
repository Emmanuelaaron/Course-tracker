module SessionsHelper
    def current_user_logged_in?
        if logged_in?
            render 'loggedin'
        end
    end
end
