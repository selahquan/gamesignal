class Api < ActiveResource::Base
    self.site = "https://api.rawg.io/api/games?54b6a98d972c42f2ae857033bc896c8b"

    self.headers['Authorization'] = 'Token token="54b6a98d972c42f2ae857033bc896c8b"'

    #self.auth_type = :bearer
    #self.bearer_token = '54b6a98d972c42f2ae857033bc896c8b'
end
