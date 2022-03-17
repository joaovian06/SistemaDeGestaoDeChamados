require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #New' do
    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns[:user]).to be_a_new(User) }
  end

  describe 'POST #Create' do
    
  end
end
