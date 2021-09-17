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
    # binding.pry
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
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

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    @landmark.update(params["landmark"])

    if !params["title"]["name"].empty?
      @landmark.titles << Title.create(params["title"])
    end

    if !params["figure"]["name"].empty?
      @landmark.figure << Figure.create(params["figure"])
    end
    @landmark.save
    redirect "landmark/#{@landmark.id}"
end
  
end
