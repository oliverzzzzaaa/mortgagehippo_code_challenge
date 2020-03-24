class ApplicationController < ActionController::Base
    helper_method :require_api_key
    skip_before_action :verify_authenticity_token

    # Skip before action required for API keys, to avoid authenticity token from rails
    # Require api key for all actions, except creating a new user 

    def require_api_key
        @user = User.find_by(api_key: params[:api_key])
        unless @user
            # Will render this if an invalid API key is provided
            render json: ['Invalid API key']
        end
    end

end
