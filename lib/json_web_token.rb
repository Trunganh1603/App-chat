class JsonWebToken
# our secret key to encode our jwt

  class << self
    def encode(payload, exp = 2.hours.from_now)
      # set token expiration time 
      payload[:exp] = exp.to_i
      
       # this encodes the user data(payload) with our secret key
      JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end

    def decode(token)
      #decodes the token to get user data (payload)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })[0]
      HashWithIndifferentAccess.new body

    # raise custom error to be handled by custom handler
    rescue JWT::ExpiredSignature, JWT::VerificationError => e
      raise CustomErrors::ExpiredSignature, e.message
    rescue JWT::DecodeError, JWT::VerificationError => e
      raise CustomErrors::DecodeError, e.message
    end
  end
end