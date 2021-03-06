require 'spec_helper'

describe Snippet do
  describe "title" do
    it "should be equal to the first line of description" do
      snippet = Snippet.make_unsaved :description => "First line of the description.\nSecond line of the description."
      snippet.title.should eql('First line of the description.')
    end
    it "should be truncated description if the first line too long" do
      snippet = Snippet.make_unsaved :description => "q"*100
      snippet.title.should eql("q"*60)
    end
    it "should be default title if description is blank" do
      snippet = Snippet.make :description => nil
      snippet.title.should eql("Code Snippet ##{snippet.id}")
    end
  end

end