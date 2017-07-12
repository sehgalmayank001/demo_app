class CatchJsonParseErrors
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      unless env['CONTENT_TYPE'] =~ /application\/json/
        error_output = "CONTENT_TYPE must be application/json"
        return [
          400, { "Content-Type" => "application/json" },
          [ { status: 400, error: error_output }.to_json ]
        ]
      end
      @app.call(env)
    rescue ActionDispatch::Http::Parameters::ParseError => error
      if env['CONTENT_TYPE'] =~ /application\/json/
        error_output = "There was a problem in the JSON you submitted: #{error}"
        return [
          400, { "Content-Type" => "application/json" },
          [ { status: 400, error: error_output }.to_json ]
        ]
      else
        raise error
      end
    end
  end
end
