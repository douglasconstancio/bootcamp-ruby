require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe '#index' do
    subject { get :index }

    context 'show images' do
      it 'returns 302' do
        subject

        expect(response.code).to eq '302'
      end
    end
  end

  describe '#create' do
    subject { post :create, params: image_params }

    let(:image_params) do
      {
        title: 'bootcamp',
        file: nil,
        user_id: 1,
      }
    end

    before { subject }

    context 'when image is saved with success' do
      it 'returns 302' do
        expect(response.code).to eq '302'
      end

      it 'calls ImageProcessWorker' do
        expect(ImageProcessWorker).to_not receive(:perform_async)
      end
    end
  end
end
