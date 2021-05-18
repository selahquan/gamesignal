class Api < ActiveResource::Base
    self.site = "https://api.rawg.io/api/games?54b6a98d972c42f2ae857033bc896c8b"

    self.headers['Authorization'] = 'Token token="54b6a98d972c42f2ae857033bc896c8b"'

    #self.auth_type = :bearer
    #self.bearer_token = '54b6a98d972c42f2ae857033bc896c8b'

    def self.get_data

        games_data = RestClient::Request.execute(
            :url => 'https://api.rawg.io/api/games?54b6a98d972c42f2ae857033bc896c8b',
            :method => :get,
            :key => '54b6a98d972c42f2ae857033bc896c8b',

        )
        JSON.parse(games_data)["results"]
    end
end
