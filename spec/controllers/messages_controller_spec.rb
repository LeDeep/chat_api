require 'spec_helper'

describe MessagesController do
  context 'routing' do
    it {should route(:post, '/messages').to :action => :create}
  end

   context 'POST create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{:screen_name => 'michael', :comment => "having so much fun", :chat_room_id => 1}}
      let(:valid_parameters) {{:message => valid_attributes}}

      it 'creates a new message' do
        expect {post :create, valid_parameters}.to change(Message, :count).by(1)
      end

      before {post :create, valid_parameters}

      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created message' do
        response.body.should eq Message.find(JSON.parse(response.body)['message']['id']).to_json
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:screen_name => '', :comment => ""}}
      let(:invalid_parameters) {{:message => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq Message.create(invalid_attributes).errors.to_json
      end
    end
  end

  context 'GET index' do
    context 'with valid parameters' do 
      let(:valid_attributes) {{:chat_room_id => 1}}
      let(:valid_parameters) {{:message => valid_attributes}}
      before {get :index, valid_parameters}
  
      it {should respond_with 200}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the messages for that chat_room_id' do
        response.body.should eq Message.where(:chat_room_id => valid_parameters[:message][:chat_room_id]).to_json
      end
    end
  end

end