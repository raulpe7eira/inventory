require 'rails_helper'

RSpec.describe MaterialsController, :type => :controller do

  login_user

  let(:materials) { create_list :valid_material, 4, user: subject.current_user }

  describe 'GET #index' do
    before(:each) { get :index }

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'loads all materials into the @metarials' do
      expect(assigns(:materials)).to match_array(materials)
    end
  end

  describe 'GET #new' do
    before(:each) { get :new }

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it 'instantiates a new material' do
      material = assigns(:material)

      expect(material).to be_kind_of ActiveRecord::Base
      expect(material).not_to be_persisted
      expect(material.user).to eq(subject.current_user)

      expect(materials).not_to include(material)
    end
  end

  describe 'GET #edit' do
    let(:edit_material) { materials.sample }

    before(:each) { get :edit, params: { id: edit_material.id } }

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end

    it 'instantiates a edit material' do
      material = assigns(:material)

      expect(material).to be_kind_of(ActiveRecord::Base)
      expect(material).to be_persisted
      expect(material.user).to eq(subject.current_user)
      expect(material).to eq(edit_material)
    end
  end

  describe 'POST #create' do
    before(:each) { post :create, params: { material: { ** new_material } } }

    context 'when valid material' do
      let(:new_material) { attributes_for(:valid_material) }

      it 'redirect to materials path if the material was created' do
        expect(flash[:notice]).to eq('messages.created')
        expect(response).to redirect_to(materials_path)
      end
    end

    context 'when invalid material' do
      let(:new_material) { attributes_for(:invalid_material) }

      it 'renders a new action if the material was not created' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    let(:edit_material) { materials.sample }

    before(:each) { patch :update, params: { id: edit_material.id, material: { ** new_values } } }

    context 'when valid material' do
      let(:new_values) { attributes_for(:valid_material) }

      it 'redirect to materials path if the material was updated' do
        expect(flash[:notice]).to eq('messages.updated')
        expect(response).to redirect_to(materials_path)
      end
    end

    context 'when invalid material' do
      let(:new_values) { attributes_for(:invalid_material) }

      it 'renders a edit action if the material was not updated' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:delete_material) { delete :destroy, params: { id: destroy_material.id } }

    context 'when valid material' do
      let(:destroy_material) { materials.sample }

      it 'redirect to materials path if the material was destroyed' do
        delete_material

        expect(flash[:notice]).to eq('messages.destroyed')
        expect(response).to redirect_to(materials_path)
      end
    end

    context 'when invalid material' do
      let(:destroy_material) { build :invalid_material }

      it 'renders a edit action if the material was not destroyed' do
        expect { delete_material }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

end
