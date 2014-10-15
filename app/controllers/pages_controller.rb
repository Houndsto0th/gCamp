class PagesController < ApplicationController


  def index
    @walt = Quote.new("Walt Whitman", ["Simplicity is the glory of expression.", "Be curious, not judgemental."])
    @durden = Quote.new("Tyler Durden", ["It's only after we've lost everything that we're free to do anything.", "The things you own end up owning you"])
    @warhol = Quote.new("Andy Warhol", ["They always say time changes things, but you actually have to change them yourself.", "Art is what you can get away with."])
    @carroll = Quote.new("Louis Carroll", ["But I don't want to go among mad people.", "Why, sometimes I've believed as many as six impossible things before breakfast"])

    @authors_and_quotes = [@walt, @durden, @warhol, @carroll]

  end

end
