require "rails_helper"


describe "Creating new game article", :type => :model do
  context "Unit validation should" do
    it "Error with no Title " do
      game = Game.new(rating: "1", hours: "1", review: "text" )
      expect(game.valid?).to eq(false)
    end
    it "Error with no rating" do
      game = Game.new(title: "title", hours: "2", review: "text")
      expect(game.save).to eq(false)
    end
    it "Error with hours" do
      game = Game.new(title: "title", rating: "2", review: "text")
      expect(game.save).to eq(false)
    end
    it "Error with no review" do
      game = Game.new(title: "title", rating: "1", hours: "2")
      expect(game.save).to eq(false)
    end
    it "be able to save project with all attribues" do
      game = Game.new(title: "Title", rating: "1", hours: "1", review: "text")
      expect(game.save).to eq(true)
    end
  end
end


describe "Editing a Game", :type => :model do
  context "" do  
    before (:each) do
      @game = Game.create(title: "Title", rating: "1", hours: "1", review: "review")
 
      end
    it "changes the title properly" do
      @game.update(:title => "New Title")
      expect(@game.title == "New Title")
    end
  end
end
