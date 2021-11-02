require 'rails_helper'

RSpec.describe 'studio index' do
  before(:each) do
    @s1 = Studio.create!(name: "Pixar", location: "Denver, Colorado")
    @s2 = Studio.create!(name: "Marvel", location: "Aurora, Colorado")
    @m1 = Movie.create!(title: "Aladdin", creation_year: 1992, genre: "Fantasy", studio_id: @s1.id)
    @m2 = Movie.create!(title: "The Avengers", creation_year: 2012, genre: "Action", studio_id: @s2.id)
  end
  it "shows each studio's name/location" do
    visit "/studios"

    expect(page).to have_content(@s1.name)
    expect(page).to have_content(@s1.location)
    expect(page).to have_content(@s2.name)
    expect(page).to have_content(@s2.location)
  end

  it 'shows all movies owned by each studio under respective studio info' do
    visit "/studios"

    expect(@s1.name).to appear_before(@m1.title)
    expect(@m1.title).to appear_before(@s2.name)
    expect(@s2.name).to appear_before(@m2.title)
    expect(page).to_not have_content(@m1.creation_year)
    expect(page).to_not have_content(@m1.genre)
    expect(page).to_not have_content(@m1.studio_id)
  end
end
