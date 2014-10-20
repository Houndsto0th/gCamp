class PagesController < ApplicationController


  def index
    @walt = Quote.new("Walt Whitman", ["Simplicity is the glory of expression.", "Be curious, not judgemental."])
    @durden = Quote.new("Tyler Durden", ["It's only after we've lost everything that we're free to do anything.", "The things you own end up owning you"])
    @warhol = Quote.new("Andy Warhol", ["They always say time changes things, but you actually have to change them yourself.", "Art is what you can get away with."])
    @carroll = Quote.new("Louis Carroll", ["But I don't want to go among mad people.", "Why, sometimes I've believed as many as six impossible things before breakfast"])

    @authors_and_quotes = [@walt, @durden, @warhol, @carroll]
  end


  def faq
    @question1 = Faq.new("What Lorem?", ["Donec sed odio dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit."])
    @question2 = Faq.new("How Ipsum?", ["Maecenas faucibus mollis interdum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."])
    @question3 = Faq.new("Very Dolor?", ["Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam quis risus eget urna mollis ornare vel eu leo. Maecenas faucibus mollis interdum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras mattis consectetur purus sit amet fermentum. Nullam id dolor id nibh ultricies vehicula ut id elit."])
    @question4 = Faq.new("Much Sit?", ["Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula ut id elit."])
    @question5 = Faq.new("Wow Amet?", ["Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Maecenas faucibus mollis interdum."])
    @question6 = Faq.new("No Consecteteur?", ["Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec id elit non mi porta gravida at eget metus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum id ligula porta felis euismod semper."])

    @frequently_asked_questions = [@question1, @question2, @question3, @question4, @question5, @question6]
  end


end
