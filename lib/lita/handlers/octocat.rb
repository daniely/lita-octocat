module Lita
  module Handlers
    class Octocat < Handler
      URL = 'https://api.github.com/octocat'

      route %r{^octocat me$}i, :octocat, command: true, help: {
        'octocat me' => 'Fetches random ascii octocat'
      }

      def octocat(response)
        http_resp = http.get(URL)

        if http_resp.status == 200
          response.reply(render_template("monospaced", octocat: http_resp.body))
        else
          Lita.logger.warn("Github octocat api could not be reached.")
        end
      end
    end

    Lita.register_handler(Octocat)
  end
end
