class Grant < ApplicationRecord
  require 'csv'
  belongs_to :state
  belongs_to :city
  belongs_to :congressional_district
  belongs_to :zipcode
  belongs_to :category
  belongs_to :nea_discipline
  belongs_to :project_discipline

  def self.parse_row(row)
    number = row[1]
    return unless number
    grant = Grant.find_by_number(number.strip) || Grant.new(number: number.strip)
    grant.year = row[0]
    grant.grantee = row[2]
    grant.organization_popular_name = row[3]
    grant.sponsored_organization = row[4]
    return unless row[6]
    grant.state = State.find_by_abbrev(row[6].strip)
    return unless grant.state
    grant.city = grant.state.cities.where(name: row[5].strip).first || grant.state.cities.create(name: row[5].strip)
    grant.full_zip = row[7]
    grant.zipcode = Zipcode.find_by_code(grant.full_zip.split('-').first)
    grant.congressional_district = grant.state.congressional_districts.where(number: row[8]).first || grant.state.congressional_districts.create(number: row[8])
    grant.amount = row[9].gsub(/[\$\,]/, '').to_f
    grant.start_date = Date.parse(row[10])
    grant.end_date = Date.parse(row[11])
    grant.intended_outcome = row[12]
    grant.category = Category.where(name: row[13].strip).first || Category.create(name: row[13].strip)
    grant.nea_discipline = NeaDiscipline.where(name: row[14].strip).first || NeaDiscipline.create(name: row[14].strip)
    if row[15]
      grant.project_discipline = ProjectDiscipline.where(name: row[15].strip).first || ProjectDiscipline.create(name: row[15].strip)
    end
    grant.project_description = row[16]
    grant.save
  end

  def self.parse_file(file)
    CSV.foreach(file, :col_sep => "\t", :quote_char => "\a") do |row|
      self.parse_row(row)
    end
  end
end
