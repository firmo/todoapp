require "spec_helper"

describe "lists crud", :type => :request do

  it "creates a list" do
    user = User.create(:email    => "user@users.com",
                       :password => "thanksforallthefish",
                       :password_confirmation => "thanksforallthefish")

    visit "/users/sign_in"

    fill_in "Email",    :with => "user@users.com"
    fill_in "Password", :with => "thanksforallthefish"

    click_button "Sign in"

    visit "/lists/new"

    fill_in "Name",    :with => "List name"

    click_button "Create List"

    page.should have_content("List was successfully created.")
  end


end