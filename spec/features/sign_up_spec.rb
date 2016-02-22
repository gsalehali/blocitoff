require "rails_helper"

describe "Sign up flow"  do
    
  context "Vallid inputs" do 
    it "allow new user to sign up with valid infromation"  do
      visit "users/sign_up"

      fill_in_information

      click_button "Sign up" 

      expect(page.has_css?(".alert-success", text: "A message with a confirmation link has been sent to your email address")).to be_truthy
    end
  end

  context "Invalid inputs" do
    it "doesn't allow invalid email addresses" do
      visit "users/sign_up"

      fill_in_information("")

      click_button "Sign up"

      expect(page.has_content?("Email can't be blank")).to be_truthy
    end

    it " doesn't allow invalid passwords" do
      visit "users/sign_up"

      fill_in_information(nil, "12345678")

      click_button "Sign up"

      expect(page.has_content?("Email can't be blank")).to be_truthy

    end
  end
end

def fill_in_information(email="test@example.com", password ="helloworld", password_confirmation="helloworld")
  fill_in "Email",                  with: email
  fill_in "Password",               with: password
  fill_in "Password confirmation",  with: password_confirmation
end
  