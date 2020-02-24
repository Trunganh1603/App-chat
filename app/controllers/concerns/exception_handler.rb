module ExceptionHandler
  extend ActiveSupport::Concern
  
  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from CustomErrors::AuthenticationError, with: :unauthorized_request
    rescue_from CustomErrors::MissingToken, with: :four_twenty_two
    rescue_from CustomErrors::InvalidToken, with: :four_twenty_two
    rescue_from CustomErrors::ExpiredSignature, with: :four_ninety_eight
    rescue_from CustomErrors::DecodeError, with: :four_zero_one
    rescue_from CustomErrors::PermissionError, with: :permission_response
    rescue_from CustomErrors::SomethingError, with: :bad_request

    rescue_from ActiveRecord::RecordNotFound do |e|
     render json: { message: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(e)
   render json: { message: e.message }, status: :unprocessable_entity
  end
 
  # JSON response with message; Status code 401 - Unauthorized
  def four_ninety_eight(e)
    render json: { message: e.message }, status: :invalid_token_time
  end

  # JSON response with message; Status code 401 - Unauthorized
  def four_zero_one(e)
    render json: { message: e.message }, status: :invalid_token
  end

   # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    render json: { message: e.message }, status: :unauthorized
  end

  def bad_request(errors)
    api_error(status: 400, errors: errors)
  end
    
  def standard_response(errors)
    api_error(status: 500, errors: errors)
  end

  def permission_response
    api_error(status: 203, errors: I18n.t('errors.messages.permission_denied'))
  end
end