module CustomErrors
  extend ActiveSupport::Concern

   # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end
  class DecodeError < StandardError; end
  class PermissionError < StandardError; end
  class SomethingError < StandardError
    def initialize(message)
      @message = message
    end

    def details
      message
    end

    private

    attr_accessor :message
  end
end