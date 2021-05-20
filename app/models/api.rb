class Api < ActiveResource::Base
    self.site = "https://api.rawg.io/api/games?key="

    self.headers['Authorization'] = 'Token token="a2bbb0a8f596467091f18dd2b1961529"'

    #self.auth_type = :bearer
    #self.bearer_token = 'a2bbb0a8f596467091f18dd2b1961529'

    def self.get_data

        games_data = RestClient::Request.execute(
            :url => 'https://api.rawg.io/api/games?key=',
            :method => :get,
            :key => 'a2bbb0a8f596467091f18dd2b1961529',

        )
        JSON.parse(games_data)["results"]
    end
end
