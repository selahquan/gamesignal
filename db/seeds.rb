# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'rest-client'

Api.get_data.each do |hash|
    platforms_array = hash["platforms"].map do |platform|
        platform["platform"]["name"]
    end 

    genres_array = hash["genres"].map do |genre|
        genre["name"]
    end

    clips_array = hash["clip"].each_value do |clip|
        clip
    end

    Game.create(slug: hash["slug"], name: hash["name"], background_image: hash["background_image"], rating: hash["rating"], platform: platforms_array, genre: genres_array, clip: clips_array)
end