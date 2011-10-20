require 'spec_helper'

describe ListsHelper do
  include Devise::TestHelpers

  before(:each) do
    @user = mock_model(User)
    helper.stub(:current_user) { @user }
    @list = mock_model(List, :name => "list")
  end

  describe "watch button" do
    it "should show watch button if list is not watched" do
      user_list_attrs = {:user_id => @user.id, :list_id => @list.id }
      UserList.stub(:where).with(user_list_attrs) { [] }

      assert helper.watch_button(@list, @user).include?("class=\"watch_button\"")
    end
  end

  describe "watch button" do
    it "should show unwatch button if list is watched" do
      user_list_attrs = {:user_id => @user.id, :list_id => @list.id }
      UserList.stub(:where).with(user_list_attrs) { [mock_model(UserList, user_list_attrs)] }

      assert helper.watch_button(@list, @user).include?("class=\"unwatch_button\"")
    end
  end
end