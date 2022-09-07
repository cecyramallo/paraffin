require 'rails_helper'

RSpec.describe LearningUnitsController, type: :request do
  describe 'GET /show' do
    let(:user) { create(:user) }
    let(:learning_unit) { create(:learning_unit) }

    before do
      sign_in user
    end

    context 'when accesing to the learning unit page' do
      def perform
        get learning_unit_path(learning_unit)
      end

      it 'redirects to the resources index page' do
        perform
        expect(perform)
          .to redirect_to(learning_unit_resources_path(learning_unit))
      end
    end
  end

  describe 'GET /index' do
    let(:user) { create(:user) }
    let(:curriculum) { curriculum_with_learning_units(learning_units_count: 7) }
    let(:params) do
      { 'curriculum_id': curriculum.id }
    end

    before do
      sign_in user
    end

    context 'when accesing the curriculum page' do
      def perform
        get curriculum_learning_units_path(params)
      end

      it 'shows the name of the curriculum' do
        perform
        expect(response.body).to match(curriculum.name)
      end

      it 'shows the name of the learning units' do
        perform
        expect(response.body).to match(curriculum.learning_units.first.name)
      end
    end
  end
end
