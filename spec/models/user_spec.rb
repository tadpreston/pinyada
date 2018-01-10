require 'rails_helper'

RSpec.describe User, type: :model do
  let(:password) { 'supersekret' }
  let(:password_confirmation) { 'supersekret' }
  let(:email) { 'test@tester.com' }

  subject(:user) { User.new(email: email, password: password, password_confirmation: password_confirmation) }

  describe 'valdite email address' do
    context 'email address is invalid' do
      let(:email) { 'test@test' }
      it 'is not valid' do
        expect(user.valid?).to be false
      end
      it 'has a message' do
        user.valid?
        expect(user.errors.messages[:email].first).to eql 'Invalid email address'
      end
    end
    context 'email is empty' do
      let(:email) { '' }
      it 'is not valid' do
        expect(user.valid?).to be false
      end
    end
  end
end
