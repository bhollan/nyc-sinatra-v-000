class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title].empty?
      new_title = Title.create(params[:title])
      @figure.titles.push(new_title)
      @figure.save
    end
    if !params[:landmark].empty?
      new_landmark = Landmark.create(params[:landmark])
      @figure.landmarks.push(new_landmark)
      @figure.save
    end
    redirect to '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    if !params[:title].empty?
      new_title = Title.create(params[:title])
      @figure.titles.push(new_title)
      @figure.save
    end
    if !params[:landmark].empty?
      new_landmark = Landmark.create(params[:landmark])
      @figure.landmarks.push(new_landmark)
      @figure.save
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
