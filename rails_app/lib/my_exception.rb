module MyException
  class NotAuthorizedException < StandardError
    attr_reader :message
    def initialize
      @message = "Not Authorized"
    end
  end
end
