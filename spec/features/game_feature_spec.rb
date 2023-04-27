require "rails_helper"


RSpec.feature "Projects", type: :feature do
  
    context "Update project" do
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        @user = FactoryBot.build(:user)
        visit edit_game_path(game)
      end
  
      let(:game) { Game.create(title: "Game", rating: "1", hours: "1", review: "text" ) }

      
      scenario "Title change success" do
        within("form") do
          fill_in "game[title]", with: "New Game"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated.")
      end

      scenario "Title empty fail" do
        within("form") do
          fill_in "game[title]", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Title can't be blank")
      end

      scenario "Rating change success" do
        within("form") do
          fill_in "game[rating]", with: "7"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated.")
      end

      scenario "Rating empty fail" do
        within("form") do
          fill_in "game[rating]", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Rating can't be blank")
      end

      scenario "Hours change success" do
        within("form") do
          fill_in "game[hours]", with: "7"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated.")
      end

      scenario "Hours empty fail" do
        within("form") do
          fill_in "game[hours]", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Hours can't be blank")
      end

      scenario "Review change success" do
        within("form") do
          fill_in "game[review]", with: "New Review Text"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated.")
      end

      scenario "Review empty fail" do
        within("form") do
          fill_in "game[review]", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Review can't be blank")
      end
    end 
      

      context "Login" do
        scenario "should sign up" do
          visit root_path
          click_link 'Sign up'
          within("form") do
            fill_in "Email", with: "testing@test.com"
            fill_in "Password", with: "123456"
            fill_in "Password confirmation", with: "123456"
            click_button "Sign up"
          end
          expect(page).to have_content("Welcome! You have signed up successfully.")
        end
  
        scenario "should log in" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          expect(page).to have_content("Logged in")
        end
      end

    end