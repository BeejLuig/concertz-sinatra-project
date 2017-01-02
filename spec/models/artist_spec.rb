require 'spec_helper'

describe 'Artist' do
  before do
    @user = User.create(:username => "test 123", :email => "test123@aol.com", :password => "test")
    @artist = Artist.create(:name => "Funky Space Reincarnation", :user_id => @user.id)
  end

  it 'has a name' do
    expect(@artist.name).to eq("Funky Space Reincarnation")
  end

  it 'can slug the name' do
    expect(@artist.slug).to eq("funky-space-reincarnation")
  end

  it 'can find a user based on the slug' do
    slug = @artist.slug
    expect(Artist.find_by_slug(slug).name).to eq("Funky Space Reincarnation")
  end
end
