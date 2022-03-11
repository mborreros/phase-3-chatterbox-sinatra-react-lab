class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # GET /messages: returns an array of all messages as JSON
  # ordered by created_at in ascending order.
  get "/messages" do
    all_messages = Message.all.order(:created_at)
    all_messages.to_json
  end

  # POST /messages: creates a new message with a body and username from params
  # returns the newly created post as JSON.

  post "/messages" do
    new_message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_message.to_json
  end

  # PATCH /messages/:id: updates the body of the message using params
  # returns the updated message as JSON.
  patch "/messages/:id" do
    message_to_update = Message.find(params[:id])
    message_to_update.update(
      body: params[:body]
    )
    message_to_update.to_json
  end
  
  # DELETE /messages/:id: deletes the message from the database.
  delete "/messages/:id" do
    message_to_delete = Message.find(params[:id])
    message_to_delete.destroy
  end

end
