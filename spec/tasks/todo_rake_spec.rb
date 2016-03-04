require 'rails_helper'
require 'rake'

describe 'todo rake task' do
  
  before :all do
    Rake.application.rake_require "tasks/todo"
    Rake::Task.define_task(:environment)
  end

  describe "todo:delete_items" do

    before do
      @user = create(:user)
      3.times { create(:item, user: @user, name: "#new task {rand}") }
      @items = @user.items
    end

    let :run_rake_test do
      Rake::Task["todo:delete_items"].reenable
      Rake::application.invoke_task "todo:delete_items"
    end

    it "removes taske older then 7 days" do
      @items.first.update_attribute(:created_at, Time.current - 7.day)
      run_rake_test
      expect(@items.count).to eq(2)
    end
  end
end