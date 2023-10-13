require "rails_helper"

RSpec.describe "#Fields" do
  describe "As a User" do
    describe 'When I visit /parents' do
      it 'Then I see the name of each parent record in the system' do
        # Arrange // Given
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        left_fork = Field.create(field_name: "Left Fork", in_season: true, total_ticks: 666)

        # Act // When
        visit "/fields"

        # Assert // Then
        expect(page).to have_content("Welcome!")

        expect(page).to have_content("#{new_joes.field_name}")
        expect(page).to have_content("#{left_fork.field_name}")
      end
    end

    describe 'When I visit /parents/:id' do
      it 'Then I see the parent with that ID including the parents attributes' do
        # Arrange // Given
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        left_fork = Field.create(field_name: "Left Fork", in_season: true, total_ticks: 666)

        # Act // When
        visit "/fields/#{new_joes.id}"

        # Assert // Then 
        expect(page).to have_content("Area Name: #{new_joes.field_name}")
        expect(page).to have_content("In Season: #{new_joes.in_season}")
        expect(page).to have_content("Total Sends: #{new_joes.total_ticks}")
      end
    end

    describe "When I visit the parent index" do
      it "I see that records are ordered by the most recently created first" do
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
        chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
        planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
        ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)

        left_fork = Field.create(field_name: "Left Fork", in_season: true, total_ticks: 666)
        wills_afire = left_fork.boulders.create(name: "Wills Afire", v_grade: 6, tick: true)
        angler = left_fork.boulders.create(name: "The Angler", v_grade: 2, tick: true)
        kill_by_numbers = left_fork.boulders.create(name: "Kill by Numbers", v_grade: 5, tick: false)
        beyond_life = left_fork.boulders.create(name: "Beyond Life", v_grade: 10, tick: true)

        visit "/fields"

        expect(new_joes.field_name).to appear_before(left_fork.field_name)
        expect(page).to have_content(new_joes.created_at)
        expect(page).to have_content(left_fork.created_at)
      end
    end

    describe "When I visit a parent's show page" do
      it "I see a count of the number of children associated with this parent" do
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
        chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
        planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
        ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)

        left_fork = Field.create(field_name: "Left Fork", in_season: true, total_ticks: 666)
        wills_afire = left_fork.boulders.create(name: "Wills Afire", v_grade: 6, tick: true)
        angler = left_fork.boulders.create(name: "The Angler", v_grade: 2, tick: true)
        kill_by_numbers = left_fork.boulders.create(name: "Kill by Numbers", v_grade: 5, tick: false)
        beyond_life = left_fork.boulders.create(name: "Beyond Life", v_grade: 10, tick: true)
        jordan = left_fork.boulders.create(name: "They Call Him Jordan", v_grade: 10, tick: false)

        visit "/fields/#{new_joes.id}"

        expect(page).to have_content("Total Boulders: 4")

        visit "fields/#{left_fork.id}"

        expect(page).to have_content("Total Boulders: 5")
      end
    end

    describe 'When I visit any page on the site' do
      it 'I see a link on top of the page that takes me to /fields' do
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
        chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
        planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
        ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)

        left_fork = Field.create(field_name: "Left Fork", in_season: true, total_ticks: 666)
        wills_afire = left_fork.boulders.create(name: "Wills Afire", v_grade: 6, tick: true)
        angler = left_fork.boulders.create(name: "The Angler", v_grade: 2, tick: true)
        kill_by_numbers = left_fork.boulders.create(name: "Kill by Numbers", v_grade: 5, tick: false)
        beyond_life = left_fork.boulders.create(name: "Beyond Life", v_grade: 10, tick: true)
        jordan = left_fork.boulders.create(name: "They Call Him Jordan", v_grade: 10, tick: false)

        visit "/fields/#{new_joes.id}"

        expect("Home").to appear_before("All Boulders")
        expect("All Boulders").to appear_before("New Joes")
      end
    end
  end
end