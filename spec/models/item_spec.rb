require 'spec_helper'

describe Item do
  fixtures :lists

  it "should create valid Item" do
    item = Item.new(:description => "item", :list => lists(:one))
    assert item.save
  end

  it "should not create Item without description" do
    item = Item.new(:description => "", :list => lists(:one))
    assert !item.save
  end
end