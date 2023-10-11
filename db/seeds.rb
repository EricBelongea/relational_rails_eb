# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)"

new_joes = Field.create(field_name: "New Joes", in_season: true, total_ticks: 101)
resident_evil = new_joes.boulders.create(name: "Resident Evil", v_grade: 9, tick: true)
chips = new_joes.boulders.create(name: "Chips", v_grade: 6, tick: true)
planet = new_joes.boulders.create(name: "Planet of the Apes", v_grade: 7, tick: true)
ghost_king = new_joes.boulders.create(name: "Ghost King", v_grade: 11, tick: false)
# Can copy and paste and use seeds for testing purposes 