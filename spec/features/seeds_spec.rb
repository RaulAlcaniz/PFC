require 'spec_helper'

describe 'Seed Data' do
  before(:all) { load Rails.root + 'db/seeds.rb' }
  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  describe 'Groups' do
    specify 'should have 10 items' do
      Group.count.should eq 10
    end

    it 'Group I should have 2 sections' do
      Group.all[0].sections.count.should eq 2
    end
  end



end