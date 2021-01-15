require "rails_helper"

RSpec.describe Hospital, type: :model do
describe 'validations' do
end

describe 'relationships' do
  it { should have_many :doctors }
  it { should have_many(:doctor_surgeries).through(:doctors) }
  it { should have_many(:surgeries).through(:doctor_surgeries) }
end

describe 'instance methods' do
end

describe 'class methods' do
end

end

