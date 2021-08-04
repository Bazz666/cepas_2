require 'rails_helper'


RSpec.describe Strain, type: :model do
  
  
  before { Strain.create!(name: 'Merlot') }
  subject {
    Strain.new(name: 'Merlot')
  }
  it 'is invalid if the name is not unique' do
  expect(subject).to be_invalid
  end

#nombre = nil
  it "is invalid without no name" do
    strain = Strain.new(name: nil)
    expect(strain).to be_invalid
  end

#nombre = ""
  it "is invalid with a blank name" do
    strain = Strain.new(name: "")
    expect(strain).to be_invalid
  end

  #nombre “Carmenere”
  it "is valid with a name" do
    strain = Strain.new(name: "Carmenere")
    expect(strain).to be_valid
  end
end