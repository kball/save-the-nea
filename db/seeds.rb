require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
CSV.foreach("data/states.csv") do |row|
  state = State.find_by_abbrev(row[1]) || State.new
  state.name = row[0]
  state.abbrev = row[1]
  state.save
end

Zipcode.parse_file('data/all-zips.csv')
Grant.parse_file('data/export.txt')
