require 'spec_helper'

describe ChatRoomsController do
  context 'routing' do
    it {should route(:post, '/chat_rooms').to :action => :create}
  end

   context 'POST create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{:started_by => 'michael', :topic => "how to have fun"}}
      let(:valid_parameters) {{:chat_room => valid_attributes}}

      it 'creates a new chat_room' do
        expect {post :create, valid_parameters}.to change(ChatRoom, :count).by(1)
      end

      before {post :create, valid_parameters}

      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created chat_room' do
        response.body.should eq ChatRoom.find(JSON.parse(response.body)['chat_room']['id']).to_json
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:started_by => '', :topic => ""}}
      let(:invalid_parameters) {{:chat_room => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq ChatRoom.create(invalid_attributes).errors.to_json
      end
    end
  end

  context 'GET index' do
    before {ChatRoom.create({:started_by => 'michael'})}
    before {get :index}

    it {should respond_with 200}
    it {should respond_with_content_type :json}
    it 'responds with a json representation of all the chat_rooms' do
      response.body.should eq ChatRoom.all.to_json
    end
  end

end