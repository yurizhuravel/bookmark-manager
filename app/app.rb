require 'sinatra/base'
require_relative 'models/link'
require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Bookmarks < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    #create a link
    link = Link.create(title: params[:title], url: params[:url])
    #create a tag for the link
    tag = Tag.first_or_create(name: params[:tags])
    #add the tag to the link's DataMapper collection
    link.tags << tag
    link.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
