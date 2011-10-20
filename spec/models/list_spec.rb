require 'spec_helper'

describe List do
  it "should create valid List" do
    list = List.new(:name => "list", :public => true)
    assert list.save
  end

  it "should not create List without name" do
    list = List.new(:name => "", :public => true)
    assert !list.save
  end
end