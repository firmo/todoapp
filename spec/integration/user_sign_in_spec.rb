require "spec_helper"

describe "signup feature", :type => :request do

  it "sign up a user" do
    visit "/users/sign_up"

    fill_in "Email",    :with => "user@users.com"
    fill_in "Password", :with => "thanksforallthefish"
    fill_in "Password confirmation", :with => "thanksforallthefish"

    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")
  end

  it "signs me in" do
    user = User.create(:email    => "user@users.com",
                       :password => "thanksforallthefish",
                       :password_confirmation => "thanksforallthefish")

    visit "/users/sign_in"

    fill_in "Email",    :with => "user@users.com"
    fill_in "Password", :with => "thanksforallthefish"

    click_button "Sign in"

    page.should have_content("Signed in successfully.")
  end

end