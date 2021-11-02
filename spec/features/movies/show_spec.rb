require 'rails_helper'

RSpec.describe 'movie show' do
  before(:each) do
    @s1 = Studio.create!(name: "Marvel", location: "Denver, Colorado")
    @m1 = Movie.create!(title: "The Avengers", creation_year: 2012, genre: "Action", studio_id: @s1.id)
    @a1 = Actor.create!(name: "Robert Downey Jr.", age: 56)
    @a2 = Actor.create!(name: "Chris Hemsworth", age: 38)
    @a3 = Actor.create!(name: "Mark Ruffalo", age: 53)
    @am1 = ActorMovie.create!(movie: @m1, actor: @a1)
    @am2 = ActorMovie.create!(movie: @m1, actor: @a2)
    visit "/movies/#{@m1.id}"
  end

  it "shows all movie information" do

    expect(page).to have_content(@m1.title)
    expect(page).to have_content(@m1.creation_year)
    expect(page).to have_content(@m1.genre)
  end

  it "shows each actor from youngest to oldest" do

    expect(page).to have_content(@a1.name)
    expect(page).to have_content(@a2.name)
    expect(page).to_not have_content(@a3.name)
    expect(@a2.name).to appear_before(@a1.name)
  end

  it "shows the average age of all actors" do

    expect(page).to have_content(@m1.average_age)
  end

  it "has a form to add new actors to the movie" do
    fill_in :name, with: @a3.name
    click_button("Add Actor")

    expect(page).to have_content(@a3.name)
  end
end
