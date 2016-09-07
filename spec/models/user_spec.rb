require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    context 'uniqueness within format' do
      before { create(:user, email: 'unique@mail.com') }
      it do
        expect(build(:user, email: 'Unique@mail.com')).to be_invalid
      end
    end
    it { is_expected.to_not allow_value("bademail@").for(:email).with_message('is invalid') }
    it { is_expected.to have_secure_password }
    # it { is_expected.to have_and_belong_to_many(:roles) }
  end
end
