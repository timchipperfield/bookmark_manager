ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './lib/link'
require_relative './lib/tag'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
  	"Hello!"
  end

  get '/links' do
  	@links = Link.all
  	erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    p "================"
    p params
    p '======--------========'
    p link.tags
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    p '==============='
    p link.tags
    link.save
    redirect '/links'
  end


  run! if app_file == $0
end