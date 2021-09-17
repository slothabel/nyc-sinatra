class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmark = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    binding.pry
    erb :'/figures/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/figures/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    unless params["title"]["name"].empty? 
      @landmark.titles << Title.create(params["title"])
    end
    unless params["landmark"]["name"].empty? 
      @landmark.landmarks << Landmark.create(params["landmark"])
    end
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end
end
