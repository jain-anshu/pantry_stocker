Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:1234' # Replace with your frontend app's origin
      resource '*', headers: :any, methods: [:get, :post, :options] # Specify allowed methods
    end
  end