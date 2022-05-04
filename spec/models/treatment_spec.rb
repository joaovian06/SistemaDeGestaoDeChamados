require 'rails_helper'

RSpec.describe Treatment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:treatment_type) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:title) }

    it do
      is_expected.to validate_length_of(:description)
        .is_at_least(50)
          .on(:create)
    end

    it do
      is_expected.to allow_values(0..5)
        .for(:rate)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:customer).inverse_of(:treatments) }
    it { is_expected.to belong_to(:consultant).inverse_of(:treatments) }
  end

  describe 'enums' do
    it 'treatments types' do
      is_expected.to define_enum_for(:treatment_type)
        .with_values([:password_reset, :software ])
    end

    it 'status' do
      is_expected.to define_enum_for(:status)
        .with_values([:open, :in_progress, :waiting, :done])
    end
  end

  describe 'factory' do
    it { expect(build(:treatment)).to be_valid }
    it { expect(build(:treatment, :invalid)).to be_invalid }
  end
end
