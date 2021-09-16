require 'pry'
class FiguresController < ApplicationController

  get '/' do
    erb :'/application/index' 
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    unless params["title"]["name"].empty? 
      @figure.titles << Title.create(params["title"])
    end
    unless params["landmark"]["name"].empty? 
      @figure.landmarks << Landmark.create(params["landmark"])
    end
    @figure.save
    redirect "figures/#{@figure.id}"
    binding.pry
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    binding.pry
    @figure.update(params["figure"])
    redirect "figures/#{@figure.id}"
  end

#   patch '/figures/:id' do
#     if !params[:figure].keys.include?("landmarks")
#     params[:figure]["landmarks"] = []
#     end

#     @figure = Figure.find_by_id(params[:id])

#     @figure.update(params["figure"])
#     if !params["figure"]["landmarks"].empty?
#       @owner.landmark << Landmark.create(landmark: params["figure"]["landmarks"])
#     end
#     redirect "figures/#{@figure.id}"
# end






end
