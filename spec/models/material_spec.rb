require 'rails_helper'

RSpec.describe Material, :type => :model do

  context 'fields' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:amount).of_type(:integer) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:user) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'scopes' do
    subject { build :material }

    describe 'ordered' do
      let!(:material_one) { create :material, user: subject.user, name: 'Monitor' }
      let!(:material_two) { create :material, user: subject.user, name: 'Computer' }

      it { expect(described_class.ordered(subject.user)).to eq([material_two, material_one]) }
    end
  end

  context 'factories' do
    it { expect(build :material).to be_valid }
    it { expect(build :invalid_material).to_not be_valid }
  end

end
