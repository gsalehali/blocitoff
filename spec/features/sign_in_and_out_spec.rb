require 'rails_helper'

describe "Sign in flow" do
  before do
    @user = create(:user)
  end

  context "valid input" do
    it "sign in successfully" do
      visit_root_and_sign_in
      expect(page.has_content?("Signed in successfully")).to be_truthy
    end

    it "redirect to user's profile" do
      visit_root_and_sign_in
      expect(current_path).to eq(user_path(@user))
    end
  end

  context "invalid input" do
    it "should display error message" do
      visit_root_and_sign_in("error@example.com")
      expect(page.has_content?("Invalid email or password")).to be_truthy
    end
  end

  describe "Sign out flow" do
    it "sign user out successfully" do
      @user = create(:user)
      visit_root_and_sign_in
      page.click_link('', :href => '/users/sign_out')
      expect(page.has_content?("Signed out successfully")).to be_truthy
    end
  end
end

def visit_root_and_sign_in(email=@user.email, password=@user.password)
  visit root_path

  within '.user-info' do
    click_link 'Sign in'
  end

  fill_in 'Email',      with: email
  fill_in 'Password',   with: password

  within 'form' do
    click_button "Sign in"
  end
end