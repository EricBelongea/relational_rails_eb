require "rails_helper"

RSpec.describe "#Boulders" do
  describe 'Child Index' do
    describe 'When I visit /child_table_name' do
      it 'I see each Child in the system including child attributes' do
        # Arrange // Given
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
        chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
        planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
        ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)

        # Act // When
        visit "/boulders"

        #Assert // Then
        expect(page).to have_content("Boulders")
        expect(page).to have_content(resident_evil.name)
        expect(page).to have_content("Grade: #{resident_evil.v_grade}")
        expect(page).to have_content("Sent: #{resident_evil.tick}")
        expect(page).to have_content(chips.name)
        expect(page).to have_content("Grade: #{chips.v_grade}")
        expect(page).to have_content("Sent: #{chips.tick}")
        expect(page).to have_content(planet.name)
        expect(page).to have_content("Grade: #{planet.v_grade}")
        expect(page).to have_content("Sent: #{planet.tick}")
      end
    end

    describe "When I visit /boulders/:id" do
      it "I see the child with that id including its attributes" do
        # Arrange // Givee
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
        chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
        planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
        ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)

        # Act // When
        visit "/boulders/#{resident_evil.id}"

        # Assert // Then
        expect(page).to have_content("#{resident_evil.name}")
        expect(page).to have_content("Grade: #{resident_evil.v_grade}")
        expect(page).to have_content("Sent: #{resident_evil.tick}")
        expect(page).to have_content("Field id: #{resident_evil.field_id}")
        expect(page).to have_content("Created at: #{resident_evil.created_at}")
        expect(page).to have_content("Updated at: #{resident_evil.updated_at}")

      end
    end
  end
end