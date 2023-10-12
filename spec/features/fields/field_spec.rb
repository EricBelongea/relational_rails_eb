require "rails_helper"

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe "#Field Index" do
  describe "As a User" do
    describe 'When I visit /parents' do
      it 'Then I see the name of each parent record in the system' do
        # Arrange // Given
        new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
        left_fork = Field.create(field_name: "Left Fork", in_season: true, total_ticks: 666)

        # Act // When
        visit "/parents"

        # Assert // Then
        expect(page).to have_content("Welcome!")

        expect(page).to have_content("#{new_joes.field_name}")
        expect(page).to have_content("#{left_fork.field_name}")
      end
    end
  end
end