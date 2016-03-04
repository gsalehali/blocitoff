require 'rails_helper'

describe Item do

  before do
    @user = create(:user)
    @item = create(:item, user: @user)
    @item2 = Item.new(name: "")
  end

  context "Attributes" do
    it "should respond to name" do
      expect(@item).to respond_to(:name)
    end

    it "should respond to user" do
      expect(@item).to respond_to(:user)
    end
  end

  context "validations" do
    it "permit valid inpute" do
      expect(@item.valid?).to be_truthy
    end

    it "doesn't permit invalid inputs" do
      expect(@item2.valid?).to be_falsey
      expect(@item2.errors.full_messages).to include("Name can't be blank")
      expect(@item2.errors.full_messages).to include("Name is too short (minimum is 5 characters)")
      expect(@item2.errors.full_messages).to include("User can't be blank")
    end
  end

  context "methods" do
    describe "#days_left" do
      it "return correct day(s) left before task is deleted" do
        @item.created_at = DateTime.current
        expect(@item.created_at.to_date).to eq(DateTime.now().to_date)
        expect(@item.days_left).to eq(7)
      end
    end
  end
end