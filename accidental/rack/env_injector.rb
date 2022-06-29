module Accidental
  module Rack
    # Rack middleware for injecting arbitrary k/v pairs into the request hash.
    class EnvInjector

      # @param app [#call] the next rack application in the middleware chain
      # @param env [Hash] the k/v pairs to inject into the request environment
      def initialize(app, **env)
        @app = app
        @env = env
      end

      def call(env)
        @app.call env.merge(@env)
      end

    end
  end
end
