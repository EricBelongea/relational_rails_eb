require "rails_helper"

RSpec.describe "#Boulder Field" do
  describe "As a user" do
    describe 'When i visit /fields/:parent_id/boulders' do
      it 'I see each child that is associated with that Parent with each Childs attributes' do
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
        chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
        planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
        ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)

        visit "/fields/#{new_joes.id}/boulders"

        expect(page).to have_content(new_joes.field_name)
        expect(page).to have_content(resident_evil.name)
        expect(page).to have_content("Grade: #{resident_evil.v_grade}")
        expect(page).to have_content("Sent: #{resident_evil.tick}")
        expect(page).to have_content("Created: #{resident_evil.created_at}")
        expect(page).to have_content("Updated: #{resident_evil.updated_at}")

        visit "/fields/#{new_joes.id}/boulders/new"


      end
    end
  end
end