require 'rails_helper'

RSpec.describe GamesController, type: :controller do

    login_user

    let(:valid_attributes) {
        { :title => "Test title!", :rating => "1", :hours => "1", :review => "Test Review" }
    }


    describe "GET #index" do
        it "returns a success response" do
            Game.create! valid_attributes
            get :index, params: {}
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
        end
    end

    describe "GET /show" do
        it "returns id page" do
            game = Game.create! valid_attributes
            get :show, params: :game
            expect(response).to be_successful
        end
    end
end