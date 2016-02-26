require "rails_helper.rb"

describe "Visiting profiles" do

  before do
    @user = create(:user)
  end

  context "signed in" do
    it "allow users to view profile" do
      visit new_user_session_path
      fill_in "Email",        with: @user.email
      fill_in "Password",     with: @user.password
      click_button "Sign in"
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.email)
    end
  end
end