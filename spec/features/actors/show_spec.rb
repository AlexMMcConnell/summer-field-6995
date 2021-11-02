require 'rails_helper'

RSpec.describe 'actor show' do
  before(:each) do
    @s1 = Studio.create!(name: "Marvel", location: "Denver, Colorado")
    @m1 = Movie.create!(title: "The Avengers", creation_year: 2012, genre: "Action", studio_id: @s1.id)
    @m2 = Movie.create!(title: "Elf", creation_year: 2003, genre: "Comedy", studio_id: @s1.id)
    @a1 = Actor.create!(name: "Robert Downey Jr.", age: 56)
    @a2 = Actor.create!(name: "Chris Hemsworth", age: 38)
    @a3 = Actor.create!(name: "Mark Ruffalo", age: 53)
    @a4 = Actor.create!(name: "Will Ferrell", age: 54)
    @am1 = ActorMovie.create!(movie: @m1, actor: @a1)
    @am2 = ActorMovie.create!(movie: @m1, actor: @a2)
    @am3 = ActorMovie.create!(movie: @m1, actor: @a3)
    # @am4 = ActorMovie.create!(movie: @m2, actor: @a4)

    visit "/actors/#{@a1.id}"
  end
  it "shows the given actor's name and age" do
    expect(page).to have_content(@a1.name)
    expect(page).to have_content(@a1.age)
  end

  it "shows all actors that the given actor has worked with" do
    expect(page).to have_content(@a2.name)
    expect(page).to have_content(@a3.name)
    expect(page).to_not have_content(@a4.name)
  end
end
