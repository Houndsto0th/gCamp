class PagesController < ApplicationController


  def index
    @walt = Quote.new("Walt Whitman", ["Simplicity is the glory of expression.", "Be curious, not judgemental."])
    @durden = Quote.new("Tyler Durden", ["It's only after we've lost everything that we're free to do anything.", "The things you own end up owning you"])
    @warhol = Quote.new("Andy Warhol", ["They always say time changes things, but you actually have to change them yourself.", "Art is what you can get away with."])
    @carroll = Quote.new("Louis Carroll", ["But I don't want to go among mad people.", "Why, sometimes I've believed as many as six impossible things before breakfast"])

    @authors_and_quotes = [@walt, @durden, @warhol, @carroll]
  end


  def faq
    @question1 = Faq.new("What is the way?", "What a fine mountain this is.")
    @question2 = Faq.new("Why don't you go to bed", "The hall is very dark.")
    @question3 = Faq.new("A man sits on top of a hundred foot pole, how can he go farther up?", "He should reach for enlightment, then he can stand up in all four corners of the sky at once.")
    @question4 = Faq.new("What is the way?", "It is right before your eyes")
    @question5 = Faq.new("Why do I not see it for myself?", "Because you are thinking of yourself")
    @question6 = Faq.new("What about you: do you see it?", "So long as you see double, saying I don't and you do, and so on, your eyes are clouded")


    @frequently_asked_questions = [@question1, @question2, @question3, @question4, @question5, @question6]
  end


end
