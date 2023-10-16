require "rails_helper"

RSpec.describe Boulder do
  describe '#instance methods' do
    it 'returns number of children associated ' do
      new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
      resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
      chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
      planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
      ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)

      expect(new_joes.boulder_count).to eq(4)
    end
  end
end