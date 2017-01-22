class Zipcode < ApplicationRecord
  require 'csv'
  belongs_to :state
  belongs_to :congressional_district

  def self.parse_file(file)
    states = State.includes(:congressional_districts).all.index_by(&:abbrev)
    CSV.foreach(file) do |row|
      zip = Zipcode.where(code: row[1]).first || Zipcode.new(code: row[1])
      raise "Couldn't find #{row[0]}" unless states[row[0]]
      zip.state = states[row[0]]
      zip.congressional_district = zip.state.congressional_districts.detect do |cd|
        cd.number == row[2].to_i
      end
      unless zip.congressional_district
        zip.congressional_district = zip.state.congressional_districts.create(number: row[2].to_i)
      end
      zip.save
    end
  end
end
