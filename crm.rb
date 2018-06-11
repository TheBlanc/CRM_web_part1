require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  @number_of_contacts = @contacts.length
  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
end


get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
