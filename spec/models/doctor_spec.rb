require "rails_helper"

RSpec.describe Doctor, type: :model do
describe 'validations' do
end

describe 'relationships' do
  it { should belong_to :hospital }
  it { should have_many :doctor_surgeries }
  it { should have_many(:surgeries).through(:doctor_surgeries) }
end

describe 'instance methods' do
end

describe 'class methods' do
end

end

