require "rails_helper"

RSpec.describe "Games", type: :request do
    let(:user) { create(:user) }
    before(:each) { sign_in user }

    let(:valid) {
        { :title => "Test title!", :rating => "1", :hours => "1", :review => "Test Review" }
    }

    let(:invalid) {
        { :title => "", :rating => "15", :hours=> "", :review => "" }
    }

    let (:edit) {
        { :title => "New Title", :rating => "2", :hours => "2", :review => "New Text"}
    }

    let(:id) {{:id => "0"}}

    describe "gets index of games" do
        it "returns index" do
            Game.create! valid
            get games_url
            expect(response).to be_successful
        end
    end

    describe "gets show" do
        it "returns page id" do
            game = Game.create! valid
            get game_url(game)
            expect(response).to be_successful
        end
    end

    describe "get new game" do
        it "goes to new game page" do
            get new_game_path
            expect(response).to be_successful
        end
    end

    describe "get id edit" do
        it "edit page" do
            game = Game.create! valid
            get edit_game_path(game)
            expect(response).to be_successful
        end
    end

    describe "posts game create" do
        context "with valid params" do
            it "makes the game" do
                expect {
                    post games_url, params: { game: valid }
                }.to change(Game, :count).by(1)
            end

            it "goes to the game" do
                post games_url, params: { game: valid }
                expect(response).to redirect_to(game_url(Game.last))
            end

        end



        context "with incorrect parameters" do
            it "will not make new game" do
                expect {
                    post games_url, params: { game: invalid }
            }.to change(Game, :count).by(0)
            end
        end
    end

    describe "Patch an edit" do
        context "with valid params" do
            it "updates" do
                game = Game.create! valid
                patch game_url(game), params: { game: edit }
                game.reload
                expect(response).to have_http_status(302)
            end

            it "goes to the show page" do
                game = Game.create! valid
                patch game_url(game), params: { game: edit }
                game.reload
                expect(response).to redirect_to(game_url(game))
            end
        end

        context "with invalid params" do
            it "fails" do
                game = Game.create! valid
                patch game_url(game), params: { game: invalid }
                expect(response).to_not be_successful
            end
        end
    end

    describe "Delete" do
        it "deletes the game on the list" do
            game = Game.create! valid
            expect{
                delete game_url(game)
        }.to change(Game, :count).by(-1)
        end
    end




end
  