class SessionsController < ApplicationController
  
    def destroy
      if current_user
        session.delete(:user_id)
        head :no_content
      else
        render json: { errors: ['Unauthorized'] }, status: :unauthorized
      end
    end
  end
  